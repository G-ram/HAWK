(*Setup type to check if we are scanning a regex pattern block*)
{
	open Parser
	type is_pat = REGEX | NO
	let state_ref = ref NO
	let add_underscores str = "_" ^ str ^ "_"
}

(*Some standard character classes*)
let digits = ['0' - '9']+
let signed_int = ['+' '-']? digits
let decimal = ['+' '-']? (digits '.' ['0'-'9']* | '.' digits) (['e' 'E'] signed_int)?

(*Rules for converting buf to tokens*)
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
	| '<' {LT} | '>' {GT} | "==" {EQ} | ">=" {GEQ} | "<=" {LEQ} | "&&" {AND} | "||" {OR}
	| '+' {PLUS} | '-' {MINUS} | '*' {TIMES} | '/' {DIVIDES} | '=' {ASSIGN} | '%' {MOD}
	| '#' {HASH}
	| "[/" {pat := REGEX ; LBRACK_FSLASH}
	| "[@" {LBRACK_AMP}  | "@]" {AMP_RBRACK} 
	| "*=" {TIMES_EQ} | "^=" {XOR_EQ} | "$=" {DOLLAR_EQ} | "~=" {TILDE_EQ}
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID( (add_underscores lxm) ) }
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '-' '_']* as lxm { CSSID(lxm) }
	| digits as lxm {INT(int_of_string lxm)}
	| decimal as lxm {DOUBLE(float_of_string lxm)}
	| '"' [^ '"']+ '"' as lxm {STRING(lxm)}
	| eof {EOF}

(*Switch to this rule when a comment is encountered*)
	and comment pat = parse
	  "*/" { token pat lexbuf }
	| _    { comment pat lexbuf }

(*Switch to this rule when a regex pattern block is encountered. This is required
because regex expressions are more general than ID and are not strings.*)
	and regex_scan pat = parse
		"/]" {pat := NO ; FSLASH_RBRACK}
		| ['\\']['"' '.' '?' '|' '^' ']' '[' '(' ')' '-' '\\' '$' '*' 'n' 't' 'r'] as lxm{REGEX_STRING(lxm)}
		| '.' {PERIOD} | '?' {QUEST} | '^' {CARROT} | '|' {VERT} | '-' {MINUS} | '*' {TIMES}
		| '[' {LBRACK} | ']' {RBRACK}
		| '(' {LPAREN} | ')' {RPAREN}
		| [^'"' '/' '.' '?' '|' '^' ']' '[' '(' ')' '-' '\\' '$' '*'] as lxm {REGEX_STRING((Char.escaped lxm))}

(*The function to get the next token; checks to see if it is scanning a regex pattern block*)
{
	let next_token lexbuf = match !state_ref with
	    | NO -> token state_ref lexbuf
	    | REGEX -> regex_scan state_ref lexbuf
}
