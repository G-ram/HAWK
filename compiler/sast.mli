type t = Int | String | Double | Table

type expr_det =
  Id of string
  |Literal of Ast.literal
  |Assign of string * expr_t
  |Binop of expr_t * Ast.op * expr_t
  |Uminus of expr_t
  |Call of string * expr_t list
  |TableAccess of string * expr_t
  and expr_t = expr_det * t

type stmt_t =
  Block of stmt_t list
  | Expr of expr_t
  | Func of func_decl_t
  | Return of expr_t
  | If of expr_t * stmt_t * stmt_t
  | While of expr_t * stmt_t
  | For of string * string * stmt_t
  and
  func_decl_t = {
    fname : string;
    params : string list;
    body : stmt_t list;
  }

type pattern_action_t = Ast.pattern * stmt_t

type program_t = {
  	begin_stmt : stmt_t;
  	pattern_actions : pattern_action_t list;
  	end_stmt : stmt_t;
}

type symbol_table = {
  parent: symbol_table option;
  mutable variables: (string*t) list
}

type environment = {
  scope: symbol_table;
  return: t option (*Not implemented*)
}
