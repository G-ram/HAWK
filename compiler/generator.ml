open Sast

let type_to_str = function
    Int -> "int"
    | Double -> "double"
    | Table(_) -> ""
    | String -> "String"

let rec repeat str n =
	match str,n with
		|s,1 -> s
		|s,n -> s ^ (repeat str (n-1))

let string_for_indent indent =
	repeat "\t" indent

let rec string_of_regex_set = function
	| Ast.RegexStringSet(str) -> str
	| Ast.RegexCharSet(ch) -> (Char.escaped ch)
	| Ast.RegexCharRangeSet(ch1,ch2) -> (Char.escaped ch1) ^ "-" ^ (Char.escaped ch2)
	| Ast.RegexComplementSet(set) -> "^" ^ (string_of_regex_set set)
	| Ast.RegexAnyCharSet -> "*"

let string_of_regex_set_sequence seq =
	let all_together = String.concat " " (List.map string_of_regex_set seq) in
	"[" ^ all_together ^ "]"

let string_of_regex_op op =
	match op with
		| Ast.Or -> "|"
		| Ast.Optional -> "?"
		| Ast.KleenePlus -> "+"
		| Ast.KleeneTimes -> "*"

let rec string_of_regex regex = match regex with
	| Ast.RegexString(str) -> str
	| Ast.RegexNested(re) -> "(" ^ (string_of_regex re) ^ ")"
	| Ast.RegexSet(sequence) -> string_of_regex_set_sequence sequence
	| Ast.RegexUnOp(re,op) -> (string_of_regex re) ^ (string_of_regex_op op)
	| Ast.RegexBinOp(re1,op,re2) -> (string_of_regex re1) ^ (string_of_regex_op op) ^ (string_of_regex re1)


let string_of_property prop = match prop with
	|Ast.ClassMatch(s) -> "." ^ s
	|Ast.IdMatch(s) -> "#" ^s
	| Ast.AttributeExists(str) -> "[" ^ str ^ "]"
	| Ast.AttributeEquals(attr,str) -> "[" ^ attr ^ "=" ^ str ^ "]"
	| Ast.AttributeContains(attr,str) -> "[" ^ attr ^ "*=" ^ str ^ "]"
	| Ast.AttributeBeginsWith(attr,str) -> "[" ^ attr ^ "^=" ^ str ^ "]"
	| Ast.AttributeEndsWith(attr,str) -> "[" ^ attr ^ "$=" ^ str ^ "]"
	| Ast.AttributeWhitespaceContains(attr,str) -> "[" ^ attr ^ "~=" ^ str ^ "]"

let string_of_type_selector = function
	|Ast.Elt(str) -> str
	| Ast.Universal -> "*"
	| Ast.NoType -> ""

let string_of_simple_selector_seq (type_selector,props) =
	let prop_string = List.fold_left (fun acc prop -> acc ^ (string_of_property prop)) "" props in
	(string_of_type_selector type_selector) ^ prop_string

let string_of_combinator = function
	| Ast.DirectChild -> " "
	| Ast.Descendent -> ">"
	| Ast.DirectSibling -> "+"
	| Ast.AnySibling -> "~"

let rec string_of_css_selector css_selector = match css_selector with
	| Ast.SingleSelector(seq) -> (string_of_simple_selector_seq seq)
	| Ast.ChainedSelectors(selector,comb,seq) -> (string_of_css_selector selector) ^ (string_of_combinator comb) ^ (string_of_simple_selector_seq seq)

let string_of_op = function
	Ast.Plus ->  " + "
	| Ast.Minus ->  " - "
	| Ast.Times ->  " * "
	| Ast.Divides ->  " / "
  | Ast.Mod -> "%"
	| Ast.Equal ->  " == "
	| Ast.NotEqual ->  " != "
	| Ast.Less ->  " < "
	| Ast.LessEqual ->  " <= "
	| Ast.Greater ->  " > "
	| Ast.GreaterEqual ->  " >= "

let string_of_key_literal = function
	Ast.IntKey(key) -> string_of_int key
	| Ast.StringKey(key) -> key

(*TODO: these don't need to all be mutually recursive*)
let rec string_of_table_literal table_lit =
	let inner_part = match table_lit with
		|Ast.TypedEmptyTableLiteral(s) -> ""
		| Ast.ArrayLiteral(lit_list) ->  (String.concat "," (List.map string_of_literal lit_list))
		| Ast.KeyValueLiteral(keyval_list) -> (String.concat "," (List.map string_of_keyval_literal keyval_list))
	in "{" ^ inner_part ^ "}"
and
string_of_literal = function
	Ast.IntLiteral(x) -> string_of_int x
	| Ast.StringLiteral(str) -> str
	| Ast.DoubleLiteral(dbl) -> string_of_float dbl
	| Ast.This-> "This"
	| Ast.TableLiteral(tbl_lit) -> string_of_table_literal tbl_lit
and
string_of_keyval_literal (key,v) =
	(string_of_key_literal key) ^ ":" ^ (string_of_literal v)

let rec string_of_expr_list = function
	[] -> ""
	| [hd] -> string_of_expr hd
	| hd::tl -> (string_of_expr hd) ^ ", " ^ string_of_expr_list tl
and
string_of_expr = function
	Id(id), _ -> id
	| Literal(lit), _ -> string_of_literal lit
	| VAssign(id, expr), t -> (type_to_str t) ^ " " ^ id ^ " = " ^ (string_of_expr expr)
	| Assign(id, expr), t -> id ^ " = " ^ (string_of_expr expr)
	| Binop(expr1, op, expr2), _ -> (string_of_expr expr1) ^ (string_of_op op) ^ (string_of_expr expr2)
	| Uminus(expr), _ -> "-" ^ (string_of_expr expr)
	| Call(id, expr_list), _ -> id ^ "(" ^ string_of_expr_list expr_list ^ ")"
	| TableAccess(table_e, ind_e), _ -> (string_of_expr table_e) ^ "[" ^ (string_of_expr ind_e) ^ "]"

let rec string_of_func_decl func_decl  =
	func_decl.fname ^ "(" ^ (String.concat "," func_decl.params) ^ ")" ^ (string_of_stmt_list func_decl.body)
and
string_of_stmt_list = function
	[] -> ""
	| hd::tl -> (string_of_stmt hd) ^ "\n" ^ (string_of_stmt_list tl)
and string_of_stmt = function
	Block(stmt_list, _) -> "{\n" ^ (string_of_stmt_list stmt_list) ^ "\n}"
	| Expr(expr) -> (string_of_expr expr) ^ ";"
	| Func(func_decl) -> string_of_func_decl func_decl
	| Return(expr) -> "Return " ^ (string_of_expr expr) ^ ";"
	| If(expr, stmt1, stmt2) -> "if(_checkIf(" ^ (string_of_expr expr) ^ "))" ^ (string_of_stmt stmt1) ^ "else" ^ (string_of_stmt stmt2)
	| While(expr, stmt) -> "while(" ^ (string_of_expr expr) ^ ")" ^ (string_of_stmt stmt)
	| For(str1, str2, stmt) -> "for(" ^ str1 ^ " : " ^ str2 ^ ")" ^ (string_of_stmt stmt)

let string_of_begin_end = function
  Block(stmt_list, _) -> string_of_stmt_list stmt_list
  | _ -> ""

let string_of_pattern pat = match pat with
		Ast.CssPattern(css_selector) -> "for(int i = 0; i < 1; i++)"(*"@" ^ (string_of_css_selector css_selector) ^ "@"*)
		| Ast.RegexPattern(regex_seq) -> "for(String _this : _regexMatcher._match(\""^(String.concat " " (List.map string_of_regex regex_seq))^"\"))"

let string_of_pattern_action (pattern,action) =
	(string_of_pattern pattern) ^ (string_of_stmt action)

let string_of_file file =
  let file_string = ref "" in
  let ic = open_in file in
    try
      while true; do
        file_string := !file_string ^ (input_line ic);
      done; !file_string
    with End_of_file ->
      close_in ic;
  !file_string

let string_of_program prog =
  (string_of_file "Imports.java")
	^ "public class Program {\n"
	^ "public static void main(String[] _args){"
  ^ (string_of_file "Setup.java")
	^ (string_of_begin_end prog.begin_stmt) ^ "\n"
	^ (String.concat "\n" (List.map string_of_pattern_action prog.pattern_actions)) ^"\n"
	^ (string_of_begin_end prog.end_stmt) ^ "\n}"
  ^ (string_of_file "BuiltIn.java")
  ^ "}"
