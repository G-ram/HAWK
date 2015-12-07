open Sast

type b_arg_types = BAny | BString | BTable

let built_in = [("print", BAny); ("open", BString); ("exits", BAny);
                ("length", BTable); ("keys", BTable); ("children", BTable); ("inner_html", BTable)]

let rec find (scope : symbol_table) name = try
  List.find (fun (s, _) -> s = name) scope.variables with Not_found ->
  match scope.parent with
    Some(parent) -> find parent name
    | _ -> raise Not_found

let rec find_built_in name typ = try
  List.find (fun (s, t) -> (s = name && t = BAny) || (s = name && t = typ)) built_in with Not_found -> raise Not_found

let is_table = function
	|Table(_) -> true
	| _ -> false

let rec check_expr env = function
  Ast.Literal(l) ->(
    match l with
     Ast.IntLiteral(v) -> Literal(l), Int
     | Ast.StringLiteral(v) -> Literal(l), String
     | Ast.DoubleLiteral(v) -> Literal(l), Double
     | Ast.This -> Literal(l), Table(String)
     | Ast.TableLiteral(tl) -> check_table_literal env tl   (*Literal(l), Table(String)*)
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
    let test = if List.length el = 1 then begin
      let (e, typ) = List.hd el in
      let typ = match typ with (*Check for correct type*)
        Table(_) -> BTable
        | String -> BString
        | _ -> BAny in
      try (*Test to see if user is trying to call built-in function and check for type*)
        ignore(find_built_in v typ) ; ()
      with Not_found -> ( (*Check if its a type error or a new function*)
          try
            let (built_in_name, _) = find_built_in v BAny in
            raise (Failure("parameter type does not match in built-in function parameter type " ^ built_in_name)) ; ()
          with Not_found -> ()
        )
    end in
    Call(v, el), Int
  | Ast.TableAccess(v, e) -> (*This is not correct!*)
    let (_, _) = check_expr env e in
    (*Check for int or string*)
    Id("dummy"), Int

and check_table_literal env tl =
	let all_the_same = function
		| [] -> true
		| lst ->
			(let hd = (List.hd lst) in
			List.for_all ((=) hd) lst)
	in
	let all_types = match tl with (*Get all the types of the inner literals *)
		| Ast.EmptyTable -> []
		| Ast.ArrayLiteral(lit_list)->
			(let exprs = List.map (fun l -> Ast.Literal(l)) lit_list
			in (List.map snd (List.map (check_expr env) exprs)))
		| Ast.KeyValueLiteral(kv_list) ->
			(let values = (List.map snd kv_list) in
			let exprs = List.map (fun l -> Ast.Literal(l)) values in
			List.map snd (List.map (check_expr env) exprs))
	in
	let sast_expr = Literal(Ast.TableLiteral(tl))
	in
	match all_types with
		| [] -> sast_expr, UnassignedTable
		| lst -> if not (all_the_same lst) then (*If literal types are not all the same, fail*)
					      raise (Failure("Mismatched element types in table literal"))
				     else
					      let table_type = (List.hd all_types) in sast_expr, Table(table_type)

let rec check_stmt env = function
  Ast.Block(sl) -> (*This may or may not be correct!*)
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
