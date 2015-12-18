type t = Int | String | Double | Table of t | EmptyTable | Void
type type_promise = unit -> t


(*update_table_link represents table variables that a given variable is implicity attached to
consider this code:
t = {}
s = t
at that point, you will add {id:"t", nesting:0}
when the type of s updated from EmptyTable to Table(something), type of t will become Table(something)

Sometimes you need more nesting. Consider:
t = {}
t[3] = {}
s = t[3]
at that point you will add {id:"t", nesting:1}
when type of s is updated from EmptyTable to Table(something), type of t will become Table(Table(something))
*)
type assigner_info = {id: string; assign_scope: symbol_table; nesting:int}

and symbol_table = {
  parent: symbol_table option;
  mutable variables: (string*t) list;
  (*When an EmptyTable variable in this list has its type updated, must also update linked variables *)
  mutable update_table_links: (string * assigner_info) list
}

type translation_environment = {
  func_decls: (string * Ast.func_decl) list;
  scope: symbol_table;
  is_pattern: bool;
  return: t option; 
  (* Keeps track of all return statement types
	 useful for assuring consistency of function call returns
  made as a reference so that children can update it
  *)
  return_assigner: assigner_info option;
  returns: (type_promise list) ref;

}

(* Represents a lazy or delayed computation for an expression
 used because we don't always initially know the type or form an expression takes
 due to empty tables
*)

and table_literal = (Ast.key_literal * expr_t) list
and expr_det =
  Id of string
  |Literal of Ast.literal
  |TableLiteral of table_literal (*Every table literal, at the end of the day, is keys and values (possibly none) *)
  |VAssign of string * expr_t_promise
  |Assign of string *  expr_t_promise
  |TableAssign of string * (expr_t list) * expr_t_promise
  |Binop of expr_t * Ast.op * expr_t
  |Uminus of expr_t
  |Call of func_decl_t * (expr_t list) (* function, parameters *)
  |BCall of string * (expr_t list) (* built-in function name, parameters *)
  |TableAccess of string * (expr_t list)
and expr_t = expr_det * t
(* Sometimes the accurate type of an expression is not known in advance
(when empty tables are involved)
, so we defer type determination til later
by using a closure
*)
and expr_t_promise = unit -> expr_t
and stmt_t =
  Block of stmt_t list * translation_environment
  | Expr of expr_t
  | Func of func_decl_t
  | Return of expr_t_promise
  | If of expr_t * stmt_t * stmt_t
  | While of expr_t * stmt_t
  | For of string * string * stmt_t
  | Empty
  and
  func_decl_t = {
    fname : string;
    params : (string * type_promise) list;
    body : stmt_t list;
	return_type_promise : type_promise
  }

type func_signature = string * (t list) 

type global_environment = {
  mutable funcs: func_decl_t list;
}

type pattern_action_t = Ast.pattern * stmt_t

type program_t = {
    concrete_funcs: func_decl_t list;
  	begin_stmt : stmt_t;
  	pattern_actions : pattern_action_t list;
  	end_stmt : stmt_t;
}
