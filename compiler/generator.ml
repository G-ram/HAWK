open Jast

let sast_expr_to_jast = function
  (Ast.Literal(v), typ) -> (
      match typ with
      Sast.Int -> Literal(Int(4))
      | _ -> Literal(Int(4))
    )
  | (Ast.Id(v), typ) -> Literal(Int(4))
  | (Ast.Assign(v, e), typ) -> Literal(Int(4))
  | (Ast.Binop(e1,op,e2), typ) -> Literal(Int(4))
  | (Ast.Uminus(e), typ) -> Literal(Int(4))
  | (Ast.Call(v, e), typ) -> Literal(Int(4))
  | (Ast.TableAccess(v, e), typ) -> Literal(Int(4))
