open Sast

let built_in = [("print", String)]

let rec find (scope : symbol_table) name = try
  List.find (fun (s, _) -> s = name) scope.variables with Not_found ->
  match scope.parent with
    Some(parent) -> find parent name
    | _ -> raise Not_found

let rec find_built_in name = try
  List.find (fun (s, _) -> s = name) built_in with Not_found -> raise Not_found

let rec check_expr env = function
  Ast.Literal(l) ->
    (match l with
     Ast.IntLiteral(v) -> Ast.Literal(l), Int
     | Ast.StringLiteral(v) -> Ast.Literal(l), String
     | Ast.DoubleLiteral(v) -> Ast.Literal(l), Double
     | Ast.This -> Ast.Literal(l), Table
     | Ast.TableLiteral(v) -> Ast.Literal(l), Table)
  | Ast.Id(v) ->
    let vdecl = try
      find env.scope (Ast.Id(v))
    with Not_found ->
      raise (Failure("undeclared identifier " ^ v)) in
    let (v, typ) = vdecl in
    v, typ
  | Ast.Assign(v, e) ->
    let (_, typ) = check_expr env e in
    let vdecl = try (*Reassigning a variable to a different type is okay because assigment = declaration*)
      let decl = find env.scope (Ast.Id(v)) in (*Add it in the symbol table if its a different type*)
        if snd decl != typ then env.scope.variables <- (decl :: env.scope.variables) ;
        decl
    with Not_found -> (*Declaring/Defining a new variable*)
      let decl = (Ast.Id(v), typ) in env.scope.variables <- (decl :: env.scope.variables) ; decl
      in
    let (v, typ) = vdecl in
    v, typ
  | Ast.Binop(e1, op, e2) ->
    let c_e1 = check_expr env e1
    and c_e2 = check_expr env e2 in

    let _, t1 = c_e1
    and _, t2 = c_e2 in
    (*Operators come in*)
    (
      match op with
      Ast.Plus -> (
        match t1, t2 with
        x, y when x = y && x != Table -> Ast.Binop(e1, op, e2), x
        | x, y when x = String || y = String -> Ast.Binop(e1, op, e2), String
        | Int, Double -> Ast.Binop(e1, op, e2), Double
        | Double, Int -> Ast.Binop(e1, op, e2), Double
        | _ , _ -> raise (Failure("binary operation type mismatch"))
        )
      | _ -> (
        match t1, t2 with
        x, y when x = y && x != Table && x != String -> Ast.Binop(e1, op, e2), x
        | Int, Double -> Ast.Binop(e1, op, e2), Double
        | Double, Int -> Ast.Binop(e1, op, e2), Double
        | _ , _ -> raise (Failure("binary operation type mismatch or operation does not support these types"))
        )
    )
  | Ast.Uminus(e) ->
    let (_, typ) = check_expr env e in
    (*Check for int or double*)
    if typ != Int && typ != Double then raise (Failure("unary minus operation does not support this type")) ;
    Ast.Uminus(e), typ
  | Ast.Call(v, e) -> (*This is not correct!*)
    (*Walk through function body and infer*)
    Ast.Id("dummy"), Int

  | Ast.TableAccess(v, e) -> (*This is not correct!*)
    let (_, typ) = check_expr env e in
    (*Check for int or string*)
    Ast.Id("dummy"), Int

let rec check_stmt env = function
  Ast.Block(sl) -> (*This may or may not be correct!*)
    let sl_t = List.map (fun s -> (check_stmt env s)) sl in
    Block(sl_t)
  | Ast.Expr(e) -> Expr(check_expr env e)
  | Ast.Func(f) -> Expr((Ast.Id("dummy"),Int)) (*This is not correct!*)
  | Ast.Return(e) -> Return(check_expr env e)
  | Ast.If(e, s1, s2) ->
    let (e, typ) = check_expr env e in
    if typ != Int && typ != Double then raise (Failure("unary minus operation does not support this type")) ;
    If((e, typ), check_stmt env s1, check_stmt env s2)
  | Ast.While(e, s) ->
    let (e, typ) = check_expr env e in
    if typ != Int && typ != Double then raise (Failure("unary minus operation does not support this type")) ;
    While((e, typ), check_stmt env s)
  | Ast.For(v, t, s) -> Expr((Ast.Id("dummy"),Int)) (*This is not correct!*)

let check_pattern env a = check_stmt env a

let init_env : environment =
    let s = {
      parent = None;
      variables = [] } in
    { scope = s; return = None; }

let check_program p =
  let env = init_env in
    {begin_stmt = check_stmt env p.Ast.begin_stmt;
    pattern_actions = List.map (fun (pattern, action) -> pattern, (check_pattern env action)) p.Ast.pattern_actions;
    end_stmt = check_stmt env p.Ast.end_stmt;}
