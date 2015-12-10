open Sast

type b_arg_types = BAny | BTable

let built_in = [("print", BAny); ("exits", BAny);
                ("length", BTable); ("keys", BTable); ("children", BTable); ("inner_html", BTable)]

let rec find_var_and_scope (scope : symbol_table) name = try
  (List.find (fun (s, _) -> s = name) scope.variables),scope with Not_found ->
  match scope.parent with
    Some(parent) -> find_var_and_scope parent name
    | _ -> raise Not_found
	

let rec find (scope : symbol_table) name = 
	fst (find_var_and_scope scope name )

let rec find_built_in name typ = try
  List.find (fun (s, t) -> (s = name && t = BAny) || (s = name && t = typ)) built_in with Not_found -> raise Not_found

(*Update a variable type of a variable within a given symbol table,
going up parent links until matching variable is found
This function has side effects*)
let rec update_variable_type sym_t var_id new_type =
	try 
		let var = (find sym_t var_id) in
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
	add_update_table_link table_id sym_tab link_id link_scope nesting;
	add_update_table_link link_id link_scope table_id sym_tab (-nesting);
	
	
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
	
(* Update the type of a table variable within a given symbol scope 
Need to ensure that table update links are respected *)
let rec update_table_type sym_t table_id new_type =
	(*First, update the table table itself *)
	update_variable_type sym_t table_id new_type;
	(*Next, update all pertinent links *)
	let table_links = List.map snd (List.filter (fun (t_id,_) -> table_id=t_id) sym_t.update_table_links) in
	let correct_linked_table_type update_link =
		let neighbor_id = update_link.link_id in
		let neighbor_sym_t = update_link.link_scope in
		(* remove links between current table and neighbor, then recursively update neighbor *)
		remove_mutual_update_table_links table_id sym_t neighbor_id neighbor_sym_t;
		let new_neighbor_type = (apply_nesting (new_type,update_link.nesting)) in
		update_table_type neighbor_sym_t neighbor_id new_neighbor_type
	in
	List.iter correct_linked_table_type table_links 


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
	sa.variables,sb.variables,sc.variables --> should be  ([("t", Table (Table Int))], [("s", Table Int)], [("u", Int)])
*)


(*Closed-open range from a to b, e.g. range 1 5 = [1;2;3;4] *)
let rec range a b =
	if a=b-1 then
		[a]
	else
		a::(range (a+1) b)

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
			match (get_table_access_type val_type (n-1)) with
				None -> None
				| x -> x
		| _ -> None


(*Are all the elements of a list the same? *)
let all_the_same = function
	| [] -> true
	| lst ->
		(let hd = (List.hd lst) in
		List.for_all ((=) hd) lst)

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
  | Ast.TableAssign(table_id, index_list, e) ->
	let (assignee_e, assignee_typ) as assignee = check_expr env e in
	let indices_sast = check_table_indices env index_list in
	let (_,table_t) = try
      find env.scope table_id
    with Not_found ->
      raise (Failure("undeclared table identifier " ^ table_id)) in
	let rec get_nested_access_type = function
		0, EmptyTable -> EmptyTable
		| 0,Table(t) -> Table(t)
		| n,Table(t) -> get_nested_access_type ((n-1),t)
		| _ -> raise (Failure "Attempt to assign to table at too high a nesting level.")
	in
	let rec update_empty_table_type old_table_t new_type =
		match old_table_t with
			Table(t) -> (Table (update_empty_table_type t new_type))
			| EmptyTable -> new_type
			| t -> t
	in
	(match table_t with
		Table(_) | EmptyTable ->
			let num_nests = (List.length index_list) in
			let nested_table_t = get_nested_access_type ((num_nests-1),table_t) in
			match nested_table_t with
				EmptyTable ->
					let new_table_type = (update_empty_table_type table_t assignee_typ) in
					update_variable_type env.scope table_id new_table_type;
					NewTableAssign (table_id, indices_sast,assignee),assignee_typ
				|Table(val_type) ->
					if val_type=assignee_typ then
						TableAssign(table_id,indices_sast,assignee),assignee_typ
					else
						raise (Failure "Trying to assign value to table with different underlying type.")
				| _ -> raise (Failure "check_expr TableAssign: Shouldn't be here. ")
		| _ -> raise (Failure "Cannot do table assignment for a non-table"))
  | Ast.Assign(v, e) ->
    let (e, typ) = check_expr env e in
    let vdecl = try (*Reassigning a variable to a different type is okay because assigment = declaration*)
      let decl = find env.scope v in (*Add it in the symbol table if its a different type*)
      if snd decl != typ then raise (Failure("identifier type does not match previously declared type " ^ v))
      else Assign(v, (e, typ)), typ
    with Not_found -> (*Declaring/Defining a new variable*)
      let decl = (v, typ) in env.scope.variables <- (decl :: env.scope.variables) ;
      VAssign(v, (e, typ)), typ
	in
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
  | Ast.TableAccess(table_id,index_exprs) ->
	(*First, get table, if it exists *)
	let (_,table_t) = try
      find env.scope table_id
    with Not_found ->
      raise (Failure("undeclared identifier " ^ table_id)) in
	(*next ensure that its a table*)
	match table_t with
		 Table(_) ->
			let index_sast = check_table_indices env index_exprs in
			let index_types = (List.map snd index_sast) in
			(*Next get the type of the variable we're acessing *)
			let access_type = (get_table_access_type table_t (List.length index_types)) in
			match access_type with
				Some(value_type) -> TableAccess (table_id,index_sast),value_type
				| None -> raise (Failure "Table does not support this level of nesting")
		| _ -> raise (Failure "Cannot do table access on non-table")
and check_table_indices env index_expr_lst =
	let index_sast = (List.map (check_expr env) index_expr_lst) in
	let index_types = (List.map snd index_sast) in
	if not (List.for_all valid_table_index_type index_types) then
		raise (Failure("All table indices must be string or int expressions"))
	else
		index_sast

and check_table_literal env tl = (*TODO: redo this shit*)
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
			let keys = List.map (fun i -> (Ast.IntKey i)) (range 0 (List.length exprs ))  in
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
    if typ != Int && typ != Double then raise (Failure("unary minus operation does not support this type")) ;
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
