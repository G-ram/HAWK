type java_import = string

type java_type = Int | Double | String | Void | ClassName(string)

(* Expressions *)
type expr =
	Id of string
	|Literal of literal
	|Assign of string * expr
	|Binop of expr * op * expr
    |Uminus of expr
	|Call of string * expr list
	|TableAccess of string * string
	

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
				
