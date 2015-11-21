type t = Int | String | Double| Table

type expr_t = Ast.expr * Type.t

type environment = {
  scope: symbol_table
  return: Type.t; (*Not implemented*)
}

type symbol_table = {
  parent: symbol_table option;
  variables: expr_t list
}

let rec find (scope : symbol_table) name = try
  List.find (fun (s, _, _, _) -> s = name) scope.variables with Not_found ->
  match scope.parent with
    Some(parent) -> find_variable parent name
    | _ -> raise Not_found

let rec check_expr env = function
  Ast.Literal(v) ->
    (match v with
     Ast.IntLiteral -> Ast.IntLiteral(v), Types.Int
     | Ast.StringLiteral -> Ast.StringLiteral(v), Types.String
     | Ast.DoubleLiteral -> Ast.DoubleLiteral(v), Types.Double
     | Ast.This -> Ast.This, Types.Table
     | Ast.TableLiteral -> Ast.TableLiteral(v), Types.Table)
  | Ast.Id(v) ->
    let vdecl = try
      find env.scope vname
    with Not_found ->
      raise (Error("undeclared identifier " ^ vname)) in
    let (vname, typ) = vdecl in
    Ast.Id(vname), typ
  | Ast.Assign(v, e) ->
    let (_, typ) = check_expr env e
    Ast.Id(v), typ
  | Ast.BinOp(e1, op, e2) ->
    let e1 = expr env e1
    and e2 = expr env e2 in

    let _, t1 = e1
    and _, t2 = e2 in
    (*Operators come in*)
    (
      match op with
      Ast.Plus ->
      | Ast.Minus ->

    )

  | Ast.Uminus(e) ->
    let (_, typ) = check_expr env e
    (*Check for int or double*)
    Ast.Uminus(e), typ
  | Ast.Call(v, e) ->
    (*Walk through function body and infer*)

  | Ast.TableAccess(v, e) -> (*QUESTION*)
    let (_, typ) = check_expr env e
    (*Check for int or string*)

let check_stmt env = function
  Ast.Block(s) ->
  | Ast.Expr(e) -> check_expr env e
  | Ast.Func(f) ->
  | Ast.Return(e) ->
  | Ast.If(e, s, s) ->
  | Ast.While(e, s) ->
  | Ast.For(v, v, s) ->
