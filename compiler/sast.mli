type t = Int | String | Double | Table of t | EmptyTable | Void

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
type update_table_link = {link_id: string; link_scope: symbol_table; nesting:int}
and symbol_table = {
  parent: symbol_table option;
  mutable variables: (string*t) list;
  (*When an EmptyTable variable in this list has its type updated, must also update linked variables *)
  mutable update_table_links: (string * update_table_link) list 
}

type translation_environment = {
  scope: symbol_table;
  return: t option (*Not implemented*)
}
	
type assign_mode = 
	Immediate
	| DeferredId of symbol_table * string
	| DeferredTableAccess of symbol_table * string * int
	| DeferredCreation of symbol_table * string
	
type expr_det =
  Id of string
  |Literal of Ast.literal
  |TableLiteral of (Ast.key_literal * expr_t) list (*Every table literal, at the end of the day, is keys and values (possibly none) *)
  |VAssign of string * expr_t * assign_mode
  |Assign of string * expr_t * assign_mode
  |DeferredAssign of string * symbol_table (*Used when assigning an emtpy table to a variable... symbol table should have full type after generating SAST *)
  |TableAssign of string * (expr_t list) * expr_t * assign_mode
  |Binop of expr_t * Ast.op * expr_t
  |Uminus of expr_t
  |Call of string * expr_t list
  |TableAccess of string * (expr_t list)
and expr_t = expr_det * t


type stmt_t =
  Block of stmt_t list * translation_environment
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
