open Ast

module StringMap = Map.Make(String)

type t = String

let tree program =

  let rec gen_table_expr table p = match p with
  Literal(l) -> (match l with
    StringLiteral(s) -> StringMap.add s String table
    | _ -> raise (Failure("WRONG!")))
  | Call(fn, actual_params) ->
    List.fold_left gen_table_expr table actual_params
  | _ -> table
  in

  let rec gen_table_stmt table p = match p with
    Block(b) ->
      List.fold_left gen_table_stmt table b
    | Expr(e) ->
      gen_table_expr table e
    | _ -> table

  in gen_table_stmt (gen_table_stmt StringMap.empty program.begin_stmt) program.end_stmt
