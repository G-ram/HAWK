open Sast

type b_arg_types = BAny | BTable

let built_in = [("print", BAny); ("exits", BAny);
                ("length", BTable); ("keys", BTable); ("children", BTable); ("inner_html", BTable)]

let rec find (scope : symbol_table) name = try
  List.find (fun (s, _) -> s = name) scope.variables with Not_found ->
  match scope.parent with
    Some(parent) -> find parent name
    | _ -> raise Not_found

let rec find_built_in name typ = try
  List.find (fun (s, t) -> (s = name && t = BAny) || (s = name && t = typ)) built_in with Not_found -> raise Not_found

 (*Closed-open range from a to b, e.g. range 1 5 = [1;2;3;4] *)
let rec range a b =
	if a=b-1 then 
		[a]
	else
		a::(range (a+1) b)
		
let is_table = function
	|Table(_) -> true
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
			(* next get all index expressions and make sure they're all string or int *)
			let index_sast = (List.map (check_expr env) index_exprs) in
			let index_types = (List.map snd index_sast) in
			if not (List.for_all (fun t -> t=String || t=Int) index_types) then
				raise (Failure("All table indices must be string or int expressions"))
			else
				(*Next get the type of the variable we're acessing *) 
				let access_type = (get_table_access_type table_t (List.length index_types)) in
				match access_type with
					Some(value_type) -> TableAccess (table_id,index_sast),value_type
					| None -> raise (Failure "Table does not support this level of nesting")
		| _ -> raise (Failure "Cannot do table access on non-table")
		
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
    let scopeT = { parent = Some(env.scope); variables = [] } in
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
      variables = [] } in
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
