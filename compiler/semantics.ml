open Sast

type b_arg_types = BAny | BTable

let built_in = [("print", BAny); ("exits", BAny);
                ("length", BTable); ("keys", BTable); ("children", BTable); ("inner_html", BTable)]

let rec find_var_and_scope (scope : symbol_table) name = try
  (List.find (fun (s, _) -> s = name) scope.variables),scope with Not_found ->
  match scope.parent with
    Some(parent) -> find_var_and_scope parent name
    | _ -> raise Not_found
	
let rec is_empty_table_container = function
	EmptyTable -> true 
	| Table(t) -> (is_empty_table_container t)
	| _ -> false 

let rec find (scope : symbol_table) name = 
	fst (find_var_and_scope scope name )
	
(*
if a variable is of type t1, can it be assigned to a variable of type t2?
obviously if:

a=3
then you can do 
a=10 (both are Int)

but also if:
a = {}
then 
a = {{3}} is allowable too
*)
let rec can_assign t1 t2 =
	match t1,t2 with
		t1,t2 when t1=t2 -> true
		| EmptyTable, Table(t) -> true
		| Table(s), Table(t) -> (can_assign s t)
		| _ -> false

let rec find_built_in name typ = try
  List.find (fun (s, t) -> (s = name && t = BAny) || (s = name && t = typ)) built_in with Not_found -> raise Not_found

(*Update a variable type of a variable within a given symbol table,
going up parent links until matching variable is found
This function has side effects*)
let rec update_variable_type sym_t var_id new_type =
	try 
		let _ = (find sym_t var_id) in (* this will raise exception if variable doesn't exist *)
		let new_variable_list = 
			List.map (fun (v_id,typ) -> if v_id=var_id then (v_id,new_type) else (v_id,typ)) sym_t.variables
		in
		ignore (sym_t.variables <- new_variable_list)
	with Not_found -> 
		match sym_t.parent with
			None -> raise (Failure "Couldn't find variable to update")
			| Some(parent) -> update_variable_type parent var_id new_type
		

let remove_update_table_link table_id sym_tab link_id link_scope =
	(* match on value equality for link id and reference equality for link scope *)
	let keep_entry (t_id,update_link) =
		not (t_id=table_id && update_link.link_id=link_id && update_link.link_scope == link_scope)
	in 
	sym_tab.update_table_links<- List.filter keep_entry sym_tab.update_table_links
	
let remove_mutual_update_table_links table_id sym_tab link_id link_scope =
	remove_update_table_link table_id sym_tab link_id link_scope;
	remove_update_table_link link_id link_scope table_id sym_tab
	
let add_update_table_link table_id sym_tab link_id link_scope nesting =
	let new_update_link = {link_id=link_id;link_scope=link_scope;nesting=nesting} in
	sym_tab.update_table_links <- (table_id,new_update_link)::sym_tab.update_table_links

(* imagine:
t = { {} }
s = t[0]

s is linked to t with nesting level 1
t is linked to s with nesting level -1

if you do:
t[0][0] = 3, then t goes from Table(EmptyTable) to Table(Table(Int)), and s should go from EmptyTable to Table(Int)

if you do:
s[0] = 3, the end result should be the same 
*)
let add_mutual_update_table_link table_id sym_tab link_id link_scope nesting =
	remove_mutual_update_table_links table_id sym_tab link_id link_scope;
	add_update_table_link table_id sym_tab link_id link_scope nesting;
	add_update_table_link link_id link_scope table_id sym_tab (-nesting)
	
	
(*nest or unnest a type with additional tables
e.g.
apply_nesting Int 1 = Table(Int)
apply_nesting Table(Table(Int)) -1 = Table(Int)
*)
let rec apply_nesting = function
	t, 0 -> t 
	| t, n when n>0 -> Table (apply_nesting (t,n-1))
	| Table(t),n when n<0 -> (apply_nesting (t,n+1))
	| _ -> raise (Failure "Attempting to unnest non-table.")
	

let is_identifier_expr = function
	| Id(_) -> true
	| TableAccess(_) -> true
	| Assign(_) -> true
	| TableAssign(_) -> true
	| _ -> false
	
(*  Consider a statement like
a = {} 
this should be deferred... we don't know how to construct 'a' until we know it's type

but if we have:
a = {}
b = a

b = a should not be deferred. Even though we don't know b's type, this should just generate
"b=a" in java just like a normal assignment
*)
let should_defer_assignment assignee_e assignee_type=
	(is_empty_table_container assignee_type) && (not (is_identifier_expr assignee_e)) 
	
let get_assignment_type assign_mode default_t =
	match assign_mode with
		| DeferredId(scope,s) -> 
			let (v,t) = (find scope s) in t
		| DeferredCreation(scope,s) ->
			let (v,t) = (find scope s) in t
		| DeferredTableAccess (scope,s,nesting) ->
			let (v,table_t) = (find scope s) in
			apply_nesting (table_t,(-nesting))
		| _ -> default_t
			

let get_assignment_mode scope var_id assignee_e assignee_type = 
	let is_et = (is_empty_table_container assignee_type) in
	match assignee_e with
		Id(s) when is_et -> DeferredId (scope,s)
		| TableAccess(s,indices) when is_et -> 
			let nesting = (List.length indices) in
			DeferredTableAccess (scope,s,nesting)
		| Assign(s,_,_) when is_et -> DeferredId (scope,s)
		| TableAssign(s,indices,_,_) when is_et ->
			let nesting = (List.length indices) in
			DeferredTableAccess (scope,s,nesting)
		| _ when is_et -> DeferredCreation (scope,var_id)
		| _ -> Immediate
	
(* Update the type of a table variable within a given symbol scope 
Need to ensure that table update links are respected *)
let rec update_table_type sym_tab table_id new_type =
	(* update all table links in depth first search style *)
	let rec update_linked_table_types table_id sym_tab new_type visited =
		(*First do the neccesary mutation and update our variable type *)
		update_variable_type sym_tab table_id new_type;
		let already_visited t_id sym_tab visited =
			List.exists (fun (t,s) -> t=t_id && s==sym_tab) visited
		in
		let visited = (table_id,sym_tab)::visited in
		let neighbors = List.map snd (List.filter (fun (t_id,_) -> table_id=t_id) sym_tab.update_table_links) in
		let unvisited_neighbors = List.filter (fun n -> not (already_visited n.link_id n.link_scope visited)) neighbors in
		let new_neighbor_types = List.map (fun n-> apply_nesting (new_type,n.nesting)) unvisited_neighbors in
		let folder = (fun visited (neighb,neighb_t) -> update_linked_table_types neighb.link_id neighb.link_scope neighb_t visited) in
		List.fold_left folder visited (List.combine unvisited_neighbors new_neighbor_types)
			
	in ignore (update_linked_table_types table_id sym_tab new_type [])
	
(*
let test_update  =
	let sa = {parent=None; variables=["t",Table(Table(EmptyTable))];
		update_table_links=[] } in
		
	let sb = {parent=Some(sa); variables=["s",Table(EmptyTable)];
		update_table_links=["s",{link_id="t";link_scope=sa;nesting=1} ]} in 
		
	let sc = {parent=Some(sb); variables=["u",EmptyTable];
		update_table_links=["u",{link_id="s";link_scope=sb;nesting=1} ]} in 
		
	sa.update_table_links<- ["t",{link_id="s";link_scope=sb;nesting=(-1)}];
	sb.update_table_links<- ("s",{link_id="u";link_scope=sc;nesting=(-1)})::sb.update_table_links;

	update_table_type sb "s" (Table Int);
	sa.variables,sb.variables,sc.variables (*--> should be  ([("t", Table (Table Int))], [("s", Table Int)], [("u", Int)])*)
*)

let is_table = function
	Table(_) | EmptyTable -> true
	| _ -> false

let valid_table_index_type = function
	Int | String -> true
	| _ -> false

(*Get the value type of a table type going n_indices levels of nesting
e.g. if table_t = Table(int) and n_indices=1 then return Some int
if table_t = Table(Table(Table(string))) and n_indices=2, return Some Table(string)
if table_t is not a table, return none *)
let rec get_table_access_type table_t n_indices =
	match table_t,n_indices with
		Table(val_type), 1 -> Some val_type
		| Table(val_type), n ->
			(match (get_table_access_type val_type (n-1)) with
				None -> None
				| x -> x)
		| _ -> None


(*Are all the elements of a list the same? *)
let all_the_same = function
	| [] -> true
	| lst ->
		(let hd = (List.hd lst) in
		List.for_all ((=) hd) lst)
		
let create_linkage_if_applicable var_id var_nesting sym_t assignee = (* TODO: this will have to also take in nesting of var_id *)
	let other_info = match assignee with 
		Id(other_id) ->
			let ((_,other_type), other_scope) = find_var_and_scope sym_t other_id in
			Some (other_id,other_type,other_scope, -var_nesting)
		| TableAccess(other_id, indices) ->
			let ((_,outer_type), other_scope) = find_var_and_scope sym_t other_id in
			let other_nesting = List.length indices in
			let other_type = (apply_nesting (outer_type,-(other_nesting))) in
			Some (other_id,other_type,other_scope,other_nesting-var_nesting)
		| _ -> None
	in match other_info with
		| Some(other_id,other_type,other_scope,other_nesting) when (is_empty_table_container other_type) ->
			add_mutual_update_table_link var_id sym_t other_id other_scope other_nesting
		| _ -> ()
				
let rec check_expr env = function
  Ast.TableLiteral(tl) -> check_table_literal env tl
  | Ast.Literal(l) ->(
    match l with
     Ast.IntLiteral(v) -> Literal(l), Int
     | Ast.StringLiteral(v) -> Literal(l), String
     | Ast.DoubleLiteral(v) -> Literal(l), Double
     | Ast.This -> Literal(l), Table(String)
     )
  | Ast.Id(v) ->
    let vdecl = try
      find env.scope v
    with Not_found ->
      raise (Failure("undeclared identifier " ^ v)) in
    let (v, typ) = vdecl in
    Id(v), typ
  | Ast.TableAssign(table_id, index_list, e) -> (*TODO: MAKE THIS SHIT MORE LIKE ASSIGN WITH TABLE LINX AND SHIT *)
	let (assignee_e, assignee_type) as assignee = check_expr env e in
	let assign_mode = get_assignment_mode env.scope table_id assignee_e assignee_type in
	let indices_sast = check_table_indices env index_list in
	let (_,table_t) = try
      find env.scope table_id
    with Not_found ->
      raise (Failure("undeclared table identifier " ^ table_id)) in
	let nesting = (List.length indices_sast) in
	(* Most nested part of *)
	let final_table_t = apply_nesting (table_t,-(nesting - 1)) in
	let rec update_empty_table_container_type old_table_t new_type =
		match old_table_t with
			Table(t) -> (Table (update_empty_table_container_type t new_type))
			| EmptyTable -> Table(new_type)
			| t -> t
	in
	(match table_t with
		Table(_) | EmptyTable ->
			let vdecl = match final_table_t with (*TODO: check assignment compatibility somewhere in here *)
				EmptyTable -> (* Going from a nested empty table to a different level of nesting, update *)
					let new_table_type = (update_empty_table_container_type table_t assignee_type) in
					update_table_type env.scope table_id new_table_type;
					TableAssign (table_id, indices_sast,assignee,assign_mode),assignee_type
				|Table(val_type) ->
					if val_type=assignee_type then
						TableAssign (table_id,indices_sast,assignee, assign_mode),assignee_type
					else
						raise (Failure "Trying to assign value to table with different underlying type.")
				| _ -> raise (Failure "check_expr TableAssign: Shouldn't be here. ")
			in
			(if (is_table assignee_type) then
				create_linkage_if_applicable table_id nesting env.scope assignee_e 
			);
			(* if RHS expr's type is empty table AND RHS is not something that should have been initialized previously 
			if (should_defer_assignment assignee_e assignee_type) then
				(DeferredAssign (table_id,env.scope)),assignee_type (* Type should get resolved somewhere down the line *)
			
			*)
			vdecl
				
		| _ -> raise (Failure "Cannot do table assignment for a non-table"))
  | Ast.Assign(v, assignee) ->
    let (assignee_e, assignee_type) as assignee = check_expr env assignee in
	let assign_mode = get_assignment_mode env.scope v assignee_e assignee_type in
    let (new_e,new_type) as vdecl = 
	try (*Reassigning a variable to a different type is okay because assigment = declaration*)
      let (_,prev_typ) = find env.scope v in (*Add it in the symbol table if its a different type*)
      if (not (can_assign prev_typ assignee_type)) then 
		raise (Failure ("identifier type cannot be assigned to previously declared type " ^ v))
      else  
		Assign (v, assignee, assign_mode), assignee_type
    with Not_found -> (*Declaring/Defining a new variable*)
      let decl = (v, assignee_type) in env.scope.variables <- (decl :: env.scope.variables) ;
      VAssign (v, assignee, assign_mode), assignee_type
	in
	(if (is_table new_type) then
		create_linkage_if_applicable v 0 env.scope assignee_e;
		update_table_type env.scope v new_type);
	vdecl
  | Ast.Binop(e1, op, e2) ->
    let e1 = check_expr env e1
    and e2 = check_expr env e2 in

    let _, t1 = e1
    and _, t2 = e2 in
    (*Operators come in*)
    (
      match op with
      Ast.Plus -> (
        match t1, t2 with
        x, y when x = y && not (is_table x) -> Binop(e1, op, e2), x
        | x, y when x = String || y = String -> Binop(e1, op, e2), String
        | Int, Double -> Binop(e1, op, e2), Double
        | Double, Int -> Binop(e1, op, e2), Double
        | _ , _ -> raise (Failure("binary operation type mismatch"))
        )
      | _ -> (
        match t1, t2 with
        x, y when x = y && not (is_table x) && x != String -> Binop(e1, op, e2), x
        | Int, Double -> Binop(e1, op, e2), Double
        | Double, Int -> Binop(e1, op, e2), Double
        | _ , _ -> raise (Failure("binary operation type mismatch or operation does not support these types"))
        )
    )
  | Ast.Uminus(e) ->
    let (e, typ) = check_expr env e in
    (*Check for int or double*)
    if typ != Int && typ != Double then raise (Failure("unary minus operation does not support this type")) ;
    Uminus((e, typ)), typ
  | Ast.Call(v, el) -> (*This is not entirely correct! Still needs to infer*)
	try 
		let func_decl = List.assoc v env.func_decls in 
		let el_typed = List.map (fun e -> (check_expr env e)) el in
		let typs = List.map snd el_typed in 
		let typed_vars = List.combine func_decl.params typs in 
		let env = {env with scope = {parent = None; variables = typed_vars; update_table_links = []}} in 
		let func_body = check_stmt env func_decl.body in 
		let is_return_stmt = function 
			Return(stmt) -> true
			| _ -> false
		in let return_stmt = List.find (fun stmt -> is_return_stmt stmt) func_body in
		let (_, return_type) = return_stmt in 
		Call(v, el_typed), return_type
	with Not_found ->
	    let el = List.map (fun e -> (check_expr env e)) el in
	    let _ = if List.length el = 1 then begin
	      let (e, typ) = List.hd el in
	      let typ = match typ with (*Check for correct type*)
	        Table(_) -> BTable
	        | _ -> BAny in
	      try (*Test to see if user is trying to call built-in function and check for type*)
	        ignore(find_built_in v typ) ; ()
	      with Not_found -> ( (*Check if its a type error or a new function*)
	          try
	            let (built_in_name, _) = find_built_in v BAny in
	            raise (Failure("parameter type does not match built-in function parameter type " ^ built_in_name))
	          with Not_found -> ()
	        )
	    end in
    	Call(v, el), Int
  | Ast.TableAccess(table_id,index_exprs) -> (*TODO: THIS SHIT*)
	(*First, get table, if it exists *)
	let (_,table_t) = try
      find env.scope table_id
    with Not_found ->
      raise (Failure("undeclared identifier " ^ table_id)) in
	(*next ensure that its a table*)
	match table_t with
		Int ->
			let index_sast = check_table_indices env index_exprs in
			let index_types = (List.map snd index_sast) in
			(*Next get the type of the variable we're acessing *)
			let access_type = (get_table_access_type table_t (List.length index_types)) in
			(match access_type with
				Some(value_type) -> TableAccess (table_id,index_sast),value_type
				| None -> raise (Failure "Table does not support this level of nesting") )
		| _ -> raise (Failure "Cannot do table access on non-table")
and check_table_indices env index_expr_lst =
	let index_sast = (List.map (check_expr env) index_expr_lst) in
	let index_types = (List.map snd index_sast) in
	if not (List.for_all valid_table_index_type index_types) then
		raise (Failure("All table indices must be string or int expressions"))
	else
		index_sast
and check_table_literal env tl = 
	let get_unique_elt lst =
		if (all_the_same lst) && (List.length lst)>0 then
			(List.hd lst)
		else
			raise (Failure("Array literal values must be the same types"))
	in
	let check_keys_exprs env keys exprs =
		let values_sast = (List.map (check_expr env) exprs) in
		let value_type = (get_unique_elt (List.map snd values_sast)) in
		(TableLiteral (List.combine keys values_sast)), (Table value_type)
	in
	match tl with
		Ast.EmptyTable -> (TableLiteral []),EmptyTable
		| Ast.ArrayLiteral(exprs) ->
			let keys = List.map (fun i -> (Ast.IntKey i)) (Util.range 0 (List.length exprs ))  in
			check_keys_exprs env keys exprs
		| Ast.KeyValueLiteral(kv_list) ->
			let keys = (List.map fst kv_list) in
			let exprs = (List.map snd kv_list) in
			check_keys_exprs env keys exprs
let rec check_stmt env = function
  Ast.Block(sl) ->
    let scopeT = { parent = Some(env.scope); variables = []; update_table_links=[] } in
    let envT = { env with scope = scopeT} in
    let sl = List.map (fun s -> (check_stmt envT s)) sl in envT.scope.variables <- List.rev scopeT.variables;
    Block(sl, envT)
  | Ast.Expr(e) -> Expr(check_expr env e)
  | Ast.Func(f) ->(
    try (*Test to see if user is trying to overwrite built-in function*)
      ignore(find_built_in f.Ast.fname BAny) ;
      raise (Failure("function is overwrites built-in function " ^ f.Ast.fname))
    with Not_found -> (*valid function*)
      Expr((Id("dummy"),Int)) (*This is not correct!*)
    )
  | Ast.Return(e) -> Return(check_expr env e)
  | Ast.If(e, s1, s2) ->
    let (e, typ) = check_expr env e in
    if typ != Int && typ != Double then raise (Failure("If statement does not support this type")) ;
    If((e, typ), check_stmt env s1, check_stmt env s2)
  | Ast.While(e, s) ->
    let (e, typ) = check_expr env e in
    if typ != Int && typ != Double then raise (Failure("unary minus operation does not support this type")) ;
    While((e, typ), check_stmt env s)
  | Ast.For(v, t, s) -> Expr((Id("dummy"),Int)) (*This is not correct!*)

let check_pattern env a = check_stmt env a

let init_env =
    let s = {
      parent = None;
      variables = [];
	  update_table_links = []} in
    { scope = s; return = None; }

let check_program p =
  let (begin_block, env) = match check_stmt init_env p.Ast.begin_stmt with
    Block(begin_block, env) -> begin_block, env
    | _ -> raise (Failure("begin is not a block")) in
  let pattern_actions = List.map (fun (pattern, action) -> pattern, (check_pattern env action)) p.Ast.pattern_actions in
  let (end_block, env) = match check_stmt env p.Ast.end_stmt with
    Block(end_block, env) -> end_block, env
    | _ -> raise (Failure("end is not a block")) in
  {begin_stmt = Block(begin_block, env);
  pattern_actions = pattern_actions;
  end_stmt = Block(end_block, env);}
