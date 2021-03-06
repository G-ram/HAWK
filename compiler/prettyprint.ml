open Ast

let rec repeat str n =
	match str,n with
		|s,1 -> s
		|s,n -> s ^ (repeat str (n-1))

let string_for_indent indent =
	repeat "\t" indent

let rec string_of_regex_set = function
	RegexStringSet(str) -> str
	| RegexRangeSet(str1, str2) -> str1 ^ "-" ^ str2
	| RegexComplementSet(set) -> "^" ^ (string_of_regex_set set)
	| RegexNestedSet(set) -> (string_of_regex_set_sequence set)

and string_of_regex_set_sequence seq =
	let all_together = String.concat " " (List.map string_of_regex_set seq) in
	"[" ^ all_together ^ "]"

let string_of_regex_op op =
	match op with
		| Or -> "|"
		| Optional -> "?"
		| KleenePlus -> "+"
		| KleeneTimes -> "*"

let rec string_of_regex regex = match regex with
  RegexString(str) -> str
  | RegexAnyChar -> "."
  | RegexNested(sequence) -> "(" ^ (string_of_regex_sequence sequence) ^ ")"
  | RegexSet(sequence) -> string_of_regex_set_sequence sequence
  | RegexUnOp(re,op) -> (string_of_regex re) ^ (string_of_regex_op op)
  | RegexBinOp(re1,op,re2) -> (string_of_regex re1) ^ (string_of_regex_op op) ^ (string_of_regex re1)

and string_of_regex_sequence seq = String.concat "" (List.map string_of_regex seq)


let string_of_property prop = match prop with
	|ClassMatch(s) -> "." ^ s
	|IdMatch(s) -> "#" ^s
	| AttributeExists(str) -> "[" ^ str ^ "]"
	| AttributeEquals(attr,str) -> "[" ^ attr ^ "=" ^ str ^ "]"
	| AttributeContains(attr,str) -> "[" ^ attr ^ "*=" ^ str ^ "]"
	| AttributeBeginsWith(attr,str) -> "[" ^ attr ^ "^=" ^ str ^ "]"
	| AttributeEndsWith(attr,str) -> "[" ^ attr ^ "$=" ^ str ^ "]"
	| AttributeWhitespaceContains(attr,str) -> "[" ^ attr ^ "~=" ^ str ^ "]"

let string_of_type_selector = function
	| Elt(str) -> str
	| Universal -> "*"
	| NoType -> ""

let string_of_simple_selector_seq (type_selector,props) =
	let prop_string = List.fold_left (fun acc prop -> acc ^ (string_of_property prop)) "" props in
	(string_of_type_selector type_selector) ^ prop_string

let string_of_combinator = function
	| DirectChild -> " "
	| Descendent -> ">"
	| DirectSibling -> "+"
	| AnySibling -> "~"

let rec string_of_css_selector css_selector = match css_selector with
	| SingleSelector(seq) -> (string_of_simple_selector_seq seq)
	| ChainedSelectors(selector,comb,seq) -> (string_of_css_selector selector) ^ (string_of_combinator comb) ^ (string_of_simple_selector_seq seq)


let string_of_op = function
	Plus ->  " + "
	| Minus ->  " - "
	| Times ->  " * "
	| Divides ->  " / "
	| Equal ->  " = "
	| Mod -> "%"
	| NotEqual ->  " != "
	| Less ->  " < "
	| LessEqual ->  " <= "
	| Greater ->  " > "
	| GreaterEqual ->  " >= "
	| BAnd -> " && "
	| BOr -> " || "

let string_of_key_literal = function
	IntKey(key) -> string_of_int key
	| StringKey(key) -> key

(*TODO: these don't need to all be mutually recursive*)
let rec string_of_table_literal table_lit =
	let inner_part = match table_lit with
		EmptyTable -> "{}"
		| ArrayLiteral(expr_list) ->  (String.concat "," (List.map string_of_expr expr_list))
		| KeyValueLiteral(keyval_list) -> (String.concat "," (List.map string_of_keyval_literal keyval_list))
	in "{" ^ inner_part ^ "}"
and
string_of_literal = function
	IntLiteral(x) -> string_of_int x
	| StringLiteral(str) -> str
	| DoubleLiteral(dbl) -> string_of_float dbl
	| This -> "This"

and
string_of_keyval_literal (key,v) =
	(string_of_key_literal key) ^ ":" ^ (string_of_expr v)
and string_of_expr_list = function
	[] -> ""
	| [hd] -> string_of_expr hd
	| hd::tl -> (string_of_expr hd) ^ ", " ^ string_of_expr_list tl
and
string_of_table_indices indices =
	let e_strings =  (List.map (fun e -> "[" ^ (string_of_expr e) ^ "]") indices) in
	(String.concat "" e_strings)
and
string_of_expr = function
	Id(id) -> id
	| Literal(lit) -> string_of_literal lit
	| TableLiteral(tbl_lit) -> string_of_table_literal tbl_lit
	| Assign(id, expr) -> id ^ " = " ^ (string_of_expr expr)
	| Binop(expr1, op, expr2) -> (string_of_expr expr1) ^ (string_of_op op) ^ (string_of_expr expr2)
	| Uminus(expr) -> "-" ^ (string_of_expr expr)
	| Call(id, expr_list) -> id ^ "(" ^ string_of_expr_list expr_list ^ ")"
	| TableAccess(t, e_list) ->
		let bracket_part = string_of_table_indices e_list in
		t ^ bracket_part
	| TableAssign(table_id, e_list, e_assignee) ->
		let bracket_part = string_of_table_indices e_list in
		table_id ^ bracket_part ^ "=" ^ (string_of_expr e_assignee)


let rec string_of_func_decl func_decl  =
	func_decl.fname ^ "(" ^ (String.concat "," func_decl.params) ^ ")" ^ (string_of_stmt_list func_decl.body)
and
string_of_stmt_list = function
	[] -> ""
	| hd::tl -> (string_of_stmt hd) ^ "\n" ^ (string_of_stmt_list tl)
and string_of_stmt = function
	Block(stmt_list) -> "{\n" ^ (string_of_stmt_list stmt_list) ^ "\n}"
	| Expr(expr) -> (string_of_expr expr) ^ ";"
	| Func(func_decl) -> string_of_func_decl func_decl
	| Return(expr) -> "Return " ^ (string_of_expr expr) ^ ";"
	| If(expr, stmt1, stmt2) -> "if(" ^ (string_of_expr expr) ^ ")" ^ (string_of_stmt stmt1) ^ "else" ^ (string_of_stmt stmt2)
	| While(expr, stmt) -> "while(" ^ (string_of_expr expr) ^ ")" ^ (string_of_stmt stmt)
	| For(str1, str2, stmt) -> "for(" ^ str1 ^ " in " ^ str2 ^ ")" ^ (string_of_stmt stmt)
	| Empty -> ""

let string_of_pattern pat =
	let inner_pat = match pat with
		CssPattern(css_selector) -> "@" ^ (string_of_css_selector css_selector) ^ "@"
		| RegexPattern(regex_seq) -> "/" ^ (string_of_regex_sequence regex_seq) ^ "/"
	in "[" ^ inner_pat ^ "]"

let string_of_pattern_action (pattern,action) =
	(string_of_pattern pattern) ^ (string_of_stmt action)

let string_of_program prog =
	"BEGIN " ^ (string_of_stmt prog.begin_stmt) ^ "\n"
	^ (String.concat "\n" (List.map string_of_pattern_action prog.pattern_actions)) ^"\n"
	^ "END" ^ (string_of_stmt prog.end_stmt)
