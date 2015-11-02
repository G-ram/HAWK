%{ open Ast %}

%token PERIOD LBRACE RBRACE AMPERSAND LT GT PLUS MINUS TIMES DIV EQ HASH TILDE COMMA
%token SEMI
%token FSLASH
%token LBRACE_AMP
%token AMP_RBRACE
%token EOF 
%token <string> STRING
%token <string> ID

/*Program structure*/
%token BEGIN END
/*other keywords*/
%token DOUBLE ELSE END IF INT RETURN STRING THIS WHILE FOR IN

/* the attribute selectors */
%token TIMES_EQ XOR_EQ DOLLAR_EQ TILDE_EQ

/*Precedence and associativity*/
%nonassoc NOELSE

%start program
%type <Ast.program> program

%%

/*Program structure */
program:
	begin_stmt pattern_action_list end_stmt EOF { {begin_stmt = $1;
													pattern_actions = $2;
													end_stmt = $3} }
	
begin_stmt:
	BEGIN LBRACE stmt_list RBRACE {$3}
end_stmt:
	END LBRACE stmt_list RBRACE {$3}
	
pattern_action_list:
	/* */ {[]}
	| pattern_action pattern_action_list {$1 :: $2}
	
pattern_action:
	pattern LBRACE stmt_list RBRACE { ($1,$3) }

/*End of program structure*/


/*Statements and expressions*/	
stmt_list:
	/* */ {[]}
	| stmt stmt_list {$1 :: $2}
	
stmt:
	expr SEMI {Expr($1)}
	| RETURN expr SEMI {Return($2)}
	| LBRACE stmt_list RBRACE {Block($2)}
	| IF LPAREN expr RPAREN stmt %prec NOELSE { If($3,$5, Block([]))}
	| IF LPAREN expr RPAREN stmt ELSE stmt { If($3,$5,$7) }
	| WHILE LPAREN expr RPAREN stmt { While($3,$5) }
	| FOR LPAREN ID IN ID RPAREN stmt { For($3,$5,$7) }
	| func_decl {Func($1)}
	
/*TODO: this*/
expr:

	
func_decl:
	ID LPAREN params_list RPAREN LBRACE stmt_list RBRACE { {fname=$1;
															params=$3;
															body=$6;
														}}
	
params_list:
	/* */ { [] }
	ID COMMA params_list {$1::$3}
	
pattern:
	LBRACE_AMP css_selector AMP_RBRACE {CssPattern($2)}
	LBRACE_AMP FSLASH regex FSLASH AMP_RBRACE {RegexPattern($3)}
	
/*End of statements and expressions*/

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
	| LBRACE ID EQ STRING RBRACE {AttributeEquals($2,$4)}
	| LBRACE ID TIMES_EQ STRING RBRACE {AttributeContains($2,$4)}
	| LBRACE ID XOR_EQ STRING RBRACE {AttributeBeginsWith($2,$4)}
	| LBRACE ID DOLLAR_EQ STRING RBRACE {AttributeEndsWith($2,$4)}
	| LBRACE ID TILDE_EQ STRING RBRACE {AttributeWhitespaceContains($2,$4)}
/*end of CSS selector stuff */

