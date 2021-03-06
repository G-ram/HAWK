(* NOTE: much of the AST code for statements/expressions is closely adapted from MicroC *)

(* CSS patterns *)
type css_combinator = DirectChild | Descendent | DirectSibling | AnySibling

type property_selector =
	ClassMatch of string
	| IdMatch of string
	| AttributeExists of string
	| AttributeEquals of string * string
	| AttributeContains of string * string
	| AttributeBeginsWith of string * string
	| AttributeEndsWith of string * string
	| AttributeWhitespaceContains of string * string

type type_selector =
	Elt of string
	| Universal
	| NoType

type simple_selector_sequence =
	type_selector * (property_selector list)

type css_selector =
	SingleSelector of simple_selector_sequence
	| ChainedSelectors of css_selector * css_combinator * simple_selector_sequence

(* Regex patterns *)
type regex_op = Or | Optional | KleenePlus | KleeneTimes

type regex_set =
	RegexStringSet of string
	| RegexRangeSet of string * string
	| RegexComplementSet of regex_set
	| RegexNestedSet of regex_set_sequence
and regex_set_sequence = regex_set list

type regex =
		RegexString of string
		| RegexAnyChar
		| RegexNested of regex_sequence
		| RegexSet of regex_set_sequence
		| RegexUnOp of regex * regex_op
		| RegexBinOp of regex * regex_op * regex
and regex_sequence = regex list


type pattern =
	CssPattern of css_selector
	| RegexPattern of regex_sequence

(* Arithmetic Expressions *)
type op = Plus | Minus | Divides | Times | Equal
            | Less | Greater | LessEqual | GreaterEqual
            | NotEqual | Mod | BAnd | BOr

(* Table Literals *)
type key_literal =
	IntKey of int
	|StringKey of string

type literal =
	IntLiteral of int
	|StringLiteral of string
	|DoubleLiteral of float
	|This
and table_literal =
    EmptyTable
	|ArrayLiteral of expr list
	|KeyValueLiteral of (key_literal * expr) list
and expr =
	Id of string
	|Literal of literal
	|TableLiteral of table_literal
	|Assign of string * expr
	|Binop of expr * op * expr
	|Uminus of expr
	|Call of string * expr list
	|TableAccess of string * (expr list)(* e.g t[1] or (t[2][3])[4]  *)
	|ThisAccess of expr 
	|TableAssign of string * (expr list) * expr

(*Program Structure and Action Syntax*)
type stmt =
	Block of stmt list
	| Expr of expr
	| Func of func_decl
	| Return of expr
	| If of expr * stmt * stmt
	| While of expr * stmt
	| For of string * string * stmt
	| ForThis of string * stmt
	| Empty
and
func_decl = {
	fname : string;
	params : string list;
	body : stmt list;
}

type pattern_action = pattern * stmt

type program = {
	begin_stmt : stmt;
	pattern_actions : pattern_action list;
	end_stmt : stmt;
}
