open Sast

(*TODO: these don't need to all be mutually recursive*)
let rec string_of_table_literal table_lit =
	let inner_part = match table_lit with
		EmptyTable -> ""
		| ArrayLiteral(lit_list) ->  ""(*(String.concat "," (List.map string_of_literal lit_list))*)
		| KeyValueLiteral(keyval_list) -> ""(*(String.concat "," (List.map string_of_keyval_literal keyval_list))
	in "{" ^ inner_part ^ "}"*)
and
string_of_literal = function
	IntLiteral(x), _ -> string_of_int x
	| StringLiteral(str), _ -> str
	| DoubleLiteral(dbl), _ -> string_of_float dbl
	| This, _ ->  "" (*"This"*)
	| TableLiteral(tbl_lit), _ -> "" (* string_of_table_literal tbl_lit *)
and
string_of_keyval_literal (key,v) =
	(* (string_of_key_literal key) ^ ":" ^ (string_of_literal v) *)

let rec string_of_expr_list = function
	[] -> ""
	| [hd] -> string_of_expr hd
	| hd::tl -> (string_of_expr hd) ^ ", " ^ string_of_expr_list tl
and
string_of_expr = function
	Id(id), _  -> id
	| Literal(lit), _ -> string_of_literal lit
	| Assign(id, expr), t -> (lowercase t) ^ " " ^ id ^ " = " ^ (string_of_expr expr)
	| Binop(expr1, op, expr2), _ -> (string_of_expr expr1) ^ (string_of_op op) ^ (string_of_expr expr2)
	| Uminus(expr), _ -> "-" ^ (string_of_expr expr)
	| Call(id, expr_list), _ -> id ^ "(" ^ string_of_expr_list expr_list ^ ")"
	| TableAccess(id, expr), _ -> (*id ^ "[" ^ (string_of_expr expr) ^ "]"*) ""

let string_of_pattern pat =
	let inner_pat = match pat with
		CssPattern(css_selector) -> "for(int i = 0; i < 1; i++)"(*"@" ^ (string_of_css_selector css_selector) ^ "@"*)
		| RegexPattern(regex_seq) -> "for(int i = 0; i < 1; i++)"(*"/" ^ (String.concat " " (List.map string_of_regex regex_seq)) ^ "/"
	in "[" ^ inner_pat ^ "]"*)

let string_of_pattern_action (pattern,action) =
	(string_of_stmt action)
