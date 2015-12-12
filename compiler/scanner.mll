{
	open Parser
	type is_pat = YES_REG | NO
	let state_ref = ref NO
}

let digits = ['0' - '9']+
let signed_int = ['+' '-']? digits
let decimal = ['+' '-']? (digits '.' ['0'-'9']* | '.' digits) (['e' 'E'] signed_int)?

rule token pat = parse
	[' ' '\t' '\r' '\n'] {token pat lexbuf}
	| "/*"     { comment pat lexbuf }
	| '.' {PERIOD}
	| '[' {LBRACK} | ']' {RBRACK}
	| '{' {LBRACE} | '}' {RBRACE}
	| '(' {LPAREN} | ')' {RPAREN}
	| ';' {SEMI} | ':' {COLON}
	| ',' {COMMA}
  | "fun" {FUN}
	| "in" {IN}
	| "BEGIN" {BEGIN} | "END" {END}
	| "else" {ELSE} | "if" {IF}
	| "while" {WHILE} | "for" {FOR}
	| "this" {THIS}
	| "return" {RETURN}
	| '~' {TILDE}
	| '<' {LT} | '>' {GT} | "==" {EQ}
	| '+' {PLUS} | '-' {MINUS} | '*' {TIMES} | '/' {DIVIDES} | '=' {ASSIGN} | '%' {MOD}
	| '#' {HASH}
	| "[/" {pat := YES_REG ; LBRACK_FSLASH}
	| "[@" {LBRACK_AMP} | "@]" {AMP_RBRACK}
	| "*=" {TIMES_EQ} | "^=" {XOR_EQ} | "$=" {DOLLAR_EQ} | "~=" {TILDE_EQ}
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
	| digits as lxm {INT(int_of_string lxm)}
	| decimal as lxm {DOUBLE(float_of_string lxm)}
	| '"' [^ '"']+ '"' as lxm {STRING(lxm)}
	| eof {EOF}

	and comment pat = parse
	  "*/" { token pat lexbuf }
	| _    { comment pat lexbuf }

	and regex_scan pat = parse
		"/]" {pat := NO ; FSLASH_RBRACK}
		| ['\\']['"' '.' '?' '|' '^' ']' '[' '(' ')' '-' '\\' '$' '*' 'n' 't' 'r'] as lxm{REGEX_STRING(lxm)}
		| '.' {PERIOD} | '?' {QUEST} | '^' {CARROT} | '|' {VERT} | '-' {MINUS} | '*' {TIMES}
		| '[' {LBRACK} | ']' {RBRACK}
		| '(' {LPAREN} | ')' {RPAREN}
		| [^'"' '/' '.' '?' '|' '^' ']' '[' '(' ')' '-' '\\' '$' '*'] as lxm {REGEX_STRING((Char.escaped lxm))}

{
	let next_token lexbuf = match !state_ref with
	    | NO -> token state_ref lexbuf
	    | YES_REG -> regex_scan state_ref lexbuf
}
