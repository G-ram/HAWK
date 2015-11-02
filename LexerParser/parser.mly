/*NOTE: much of the parsing code for statements/expressions is directly adapted from MicroC*/

%{ open Ast %}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET
%token PLUS MINUS TIMES DIVIDES EQ
%token PERIOD AMPERSAND LT GT ASSIGN HASH TILDE COMMA
%token SEMI
%token FSLASH
%token LBRACE_AMP
%token AMP_RBRACE
%token EOF 
%token <string> STRING
%token <int> INT
%token <double> DOUBLE
%token <string> ID

/*Program structure*/
%token BEGIN END
/*other keywords*/
%token ELSE END IF INT RETURN STRING THIS WHILE FOR IN

/* the attribute selectors */
%token TIMES_EQ XOR_EQ DOLLAR_EQ TILDE_EQ

/*Precedence and associativity*/
%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN

%start program
%type <Ast.program> program

%%

/*Program structure */
program:
	begin_stmt pattern_action_list end_stmt EOF { {begin_stmt = $1;
													pattern_actions = $2;
													end_stmt = $3} }
	
begin_stmt:
	BEGIN LBRACKET stmt_list RBRACKET {$3}
end_stmt:
	END LBRACKET stmt_list RBRACKET {$3}
	
pattern_action_list:
	/* */ {[]}
	| pattern_action pattern_action_list {$1 :: $2}
	
pattern_action:
	pattern LBRACKET stmt_list RBRACKET { ($1,$3) }

/*End of program structure*/


/*Statements and expressions*/	
stmt_list:
	/* */ {[]}
	| stmt stmt_list {$1 :: $2}
	
stmt:
	expr SEMI {Expr($1)}
	| RETURN expr SEMI {Return($2)}
	| LBRACKET stmt_list RBRACKET {Block($2)}
	| IF LPAREN expr RPAREN stmt %prec NOELSE { If($3,$5, Block([]))}
	| IF LPAREN expr RPAREN stmt ELSE stmt { If($3,$5,$7) }
	| WHILE LPAREN expr RPAREN stmt { While($3,$5) }
	| FOR LPAREN ID IN ID RPAREN stmt { For($3,$5,$7) }
	| func_decl {Func($1)}
	
expr:
	ID {Id($1)}
	| ID ASSIGN expr {Assign($1,$3)}
	| expr op expr {Binop($1,$2,$3)}
	| literal {Literal($1)}
	| ID LBRACE STRING RBRACE {TableAccess($1,$3)}
	| ID LPAREN expr_list RPAREN {Call($1,$3)}
	
expr_list:
	/* */ { [] }
	| expr COMMA expr_list { $1 :: $3 }
	
literal:
	INT {IntLiteral($1)}
	|STRING {StringLiteral($1)}
	|DOUBLE {DoubleLiteral($1)}
	|table_literal {TableLiteral($1)}
	
table_literal:
	array_literal {ArrayLiteral($1)}
	|keyvalue_literal {KeyValueLiteral($1)}
	
array_literal:
	LBRACKET literal_list RBRACKET {$2}
	
keyvalue_literal:
	LBRACKET keyvalue_list RBRACKET {$2}
	
keyvalue_list:
	keyvalue { [$1] }
	|keyvalue COMMA keyvalue_list { $1 :: $3}

keyvalue:
	INT { IntKey($1) }
	| STRING { StringKey($1) }
	
literal_list:
	/* */ { [] }
	| literal COMMA literal_list { $1 :: $3}
op:
	PLUS {Plus}
	|MINUS {Minus}
	|DIVIDES {Divides}
	|TIMES {Times}
	|EQ {Equals}
	
func_decl:
	ID LPAREN params_list RPAREN LBRACE stmt_list RBRACE { {fname=$1;
															params=$3;
															body=$6;
														}}
	
params_list:
	/* */ { [] }
	| ID COMMA params_list {$1::$3}
	
pattern:
	LBRACE_AMP css_selector AMP_RBRACE {CssPattern($2)}
	| LBRACE_AMP FSLASH regex FSLASH AMP_RBRACE {RegexPattern($3)}
	
/*End of statements and expressions*/

/*Start of Regex stuff: GRAHAM you come in here :) */
regex:
	STRING {RegexPattern($1)} /*if we wanted to be lazy 
	we could keep it like this and make regex errors happen at runtime. But that would be lame*/
								
	
/*End of Regex stuff*/

/*Start of CSS Selector stuff*/
css_selector:
	simple_selector_seq {SingleSelector($1)}
	| css_selector PLUS simple_selector_seq {ChainedSelectors($1,DirectSibling,$3)}
	| css_selector GT simple_selector_seq {ChainedSelectors($1,Descendent,$3)}
	| css_selector TILDE simple_selector_seq {ChainedSelectors($1,AnySibling,$3)}
	| css_selector typed_simple_selector_seq {ChainedSelectors($1,DirectChild,$2)}
	
simple_selector_seq:
	typed_simple_selector_seq {$1}
	| property_selector_list {(NoType,$1)}

typed_simple_selector_seq:
	type_selector {($1,[])}
	| type_selector property_selector_list {($1,$2)}
	
type_selector:
	TIMES {Universal}
	|ID {Elt($1)}
	
property_selector_list:
	property_selector { [$1]}
	| property_selector property_selector_list { $1::$2}
	
property_selector:
	PERIOD ID {ClassMatch($2)}
	| HASH ID {IdMatch($2)}
	| LBRACE ID RBRACE {AttributeExists($2)}
	| LBRACE ID ASSIGN STRING RBRACE {AttributeEquals($2,$4)}
	| LBRACE ID TIMES_EQ STRING RBRACE {AttributeContains($2,$4)}
	| LBRACE ID XOR_EQ STRING RBRACE {AttributeBeginsWith($2,$4)}
	| LBRACE ID DOLLAR_EQ STRING RBRACE {AttributeEndsWith($2,$4)}
	| LBRACE ID TILDE_EQ STRING RBRACE {AttributeWhitespaceContains($2,$4)}
/*end of CSS selector stuff */

