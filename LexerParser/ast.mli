
(* Everything having to do with CSS patterns *)
type combinator = DirectChild | Descendent | DirectSibling | AnySibling

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
	| ChainedSelectors of css_selector * combinator * simple_selector_sequence
	
type pattern = 
	CssPattern of css_selector
	| RegexPattern of string
	
type func_decl = {
	fname : string;
	params : string list;
	body : stmt list
}

type op = Plus | Minus | Divides | Times

type expr = 
	IntLiteral of int
	|StringLiteral of string
	|DoubleLiteral of string
	|TableLiteral of table_literal
	|Assign of string * expr
	|Binop of expr * op * expr
	|Call of string * expr list
	|TableAccess of string * string
	
(*program structure and action syntax*)
type stmt =
	Block of stmt list
	| Expr of expr
	| Func of func_decl
	| Return of expr
	| If of expr * stmt * stmt
	| While of expr * stmt
	| For of string * string * stmt
	
type pattern_action = pattern * stmt
	
type program = {
	begin_stmt : stmt;
	pattern_actions : pattern_action list;
	end_stmt : stmt;
}


	
