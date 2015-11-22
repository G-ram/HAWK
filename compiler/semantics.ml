open Sast

let rec find (scope : symbol_table) name = try
  List.find (fun (s, _) -> s = name) scope.variables with Not_found ->
  match scope.parent with
    Some(parent) -> find parent name
    | _ -> raise Not_found

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
    Ast.Id(v), typ
  | Ast.Binop(e1, op, e2) ->
    let e1 = check_expr env e1
    and e2 = check_expr env e2 in

    let _, t1 = e1
    and _, t2 = e2 in
    (*Operators come in*)
    (
      match op with
      Ast.Plus -> Ast.Id("dummy"), Int
      | _ -> Ast.Id("dummy"), Int
    )
  | Ast.Uminus(e) ->
    let (_, typ) = check_expr env e in
    (*Check for int or double*)
    Ast.Uminus(e), typ
  | Ast.Call(v, e) ->
    (*Walk through function body and infer*)
    Ast.Id("dummy"), Int

  | Ast.TableAccess(v, e) -> (*QUESTION*)
    let (_, typ) = check_expr env e in
    (*Check for int or string*)
    Ast.Id("dummy"), Int

let rec check_stmt env = function
  Ast.Block(s) -> Expr((Ast.Id("dummy"),Int))
  | Ast.Expr(e) -> Expr(check_expr env e)
  | Ast.Func(f) -> Expr((Ast.Id("dummy"),Int))
  | Ast.Return(e) -> Return(check_expr env e)
  | Ast.If(e, s1, s2) -> Expr((Ast.Id("dummy"),Int))
  | Ast.While(e, s) -> Expr((Ast.Id("dummy"),Int))
  | Ast.For(v, t, s) -> Expr((Ast.Id("dummy"),Int))

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
