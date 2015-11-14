open Ast

let get_java_fun_name hawk_fun =
	if hawk_fun= "print" then "System.out.println" else hawk_fun

let codegen_literal = function
	|IntLiteral(i) -> string_of_int i
	|StringLiteral(s) -> s
	|DoubleLiteral(f) -> string_of_float f
    |This -> "hawkPatternContext"
	| _ -> raise (Failure "not implemented")
	(* |TableLiteral of table_literal *)
	
let rec codegen_expr = function
	| Call(str,e_list) -> 
		let arg_strings = String.concat "," (List.map codegen_expr e_list) in
		(get_java_fun_name str) ^ "(" ^ arg_strings ^ ")"
	| Literal(lit) -> codegen_literal lit
	| _ -> ""

let rec codegen_stmt = function
	Block(stmt_list) -> String.concat ";\n" (List.map codegen_stmt stmt_list)
	| Expr(e) -> (codegen_expr e) ^ ";\n"
	| _ -> ""
	(*
	| Func of func_decl
	| Return of expr
	| If of expr * stmt * stmt
	| While of expr * stmt
	| For of string * string * stmt*)

let codegen_program p =
	"class Program {\n" ^ 
	"public static void main(String[] args){" ^
	codegen_stmt p.begin_stmt ^ codegen_stmt p.end_stmt ^ "}\n"
	^ "}"