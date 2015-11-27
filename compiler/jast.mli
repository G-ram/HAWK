type java_import = string

type java_type = Int | Double | String | Void | ClassName of string

type java_literal =
	Int of int
	| Double of float
	| String of string
	| Null

type op = Plus | Minus | Times | Divides | Greater | GreaterEqual | Less | LessEqual | Equal

type java_call = string * (java_expr list)

and java_expr =
	Id of string
	| Literal of java_literal
	| Assign of string * java_expr
	| Binop of java_expr * op * java_expr
	| NewObj of string * (java_expr list)
	| Call of java_call (* e.g. SomeFunc(3,a+b) *)
	| MethodCall of java_expr * java_call (* e.g. (new Integer()).toString() *)

(* optional expr because we can either have "int a;" or "int a = 4;" *)
type java_var_decl = {var_type: java_type;
						var_id: string;
						value: java_expr option;
					}

type java_fun_decl = { return_type: java_type;
						fun_id: string;
						fun_vars: java_var_decl list;
						fun_body: java_stmt
					}
and java_stmt =
	Block of java_stmt list
	| VarDecl of java_var_decl
	| Expr of java_expr
	| Func of java_fun_decl
	| Return of java_expr
	| If of java_expr * java_stmt * java_stmt
	| While of java_expr * java_stmt
	| For of java_stmt * java_expr * java_stmt * java_stmt (* for(initial_statement; expr_condition; end_statement){  statement } *)

type java_modifier = Public | Private | Static | Final

type java_class_var_decl = (java_modifier list) * java_var_decl

type java_class_fun_decl = (java_modifier list) * java_fun_decl

type java_class = {
					class_name : string;
					var_decls: java_class_var_decl list;
					fun_decls: java_class_fun_decl list
				}

type java_program = {
				imports : java_import list;
				program_class : java_class;
				}
