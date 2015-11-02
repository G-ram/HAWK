{open Parser}

let digits = ['0' - '9']+
let signed_int = ['+' '-']? digits
let decimal = ['+' '-']? (digits '.' ['0'-'9']* | '.' digits) (['e' 'E'] signed_int)?

rule token = parse
	[' ' '\t' '\r' '\n'] {token lexbuf}
	| '.' {PERIOD}
	| '[' {LBRACE} | ']' {RBRACE}
	| '{' {LBRACKET} | '}' {RBRACKET}
	| '(' {LPAREN} | ')' {RPAREN}
	| '/' {FSLASH}
	| ';' {SEMI}
	| ',' {COMMA}
	| "in" {IN}
	| "BEGIN" {BEGIN} | "END" {END}
	| "double" {DOUBLE} | "int" {INT} | "string" {STRING}
	| "else" {ELSE} | "if" {IF} 
	| "while" {WHILE} | "for" {FOR}
	| "this" {THIS}
	| '&' {AMPERSAND}
	| '~' {TILDE}
	| '<' {LT} | '>' {GT} | "==" {EQ}
	| '+' {PLUS} | '-' {MINUS} | '*' {TIMES} | '/' {DIVIDES} | '=' {EQ}
	| '#' {HASH}
	| "[@" {LBRACE_AMP} | "@]" {AMP_RBRACE}
	| "*=" {TIMES_EQ} | "^=" {XOR_EQ} | "$=" {DOLLAR_EQ} | "~=" {TILDE_EQ}
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
	| signed_int as lxm {INT(int_of_string lxm)}
	| decimal as lxm {DOUBLE(float_of_string lxm)}
	| '"' [^ '"']+ '"' as lxm { STRING(lxm) }
	| eof {EOF}
