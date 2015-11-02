{open Parser}

rule token = parse
	[' ' '\t' '\r' '\n'] {token lexbuf}
	| '.' {PERIOD}
	| '[' {LBRACE} | ']' {RBRACE}
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
	| '<' {LT} | '>' {GT}
	| '+' {PLUS} | '-' {MINUS} | '*' {TIMES} | '/' {DIV} | '=' {EQ}
	| '#' {HASH}
	| "[@" {LBRACE_AMP} | "@]" {AMP_RBRACE}
	| "*=" {TIMES_EQ} | "^=" {XOR_EQ} | "$=" {DOLLAR_EQ} | "~=" {TILDE_EQ}
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
	| '"' [^ '"']+ '"' as lxm { STRING(lxm) }
	| eof {EOF}
