%{ open Ast %}

%token PERIOD LBRACE RBRACE AMPERSAND LT GT PLUS MINUS TIMES DIV EQ HASH TILDE
%token LBRACE_AMP
%token AMP_RBRACE
%token EOF 
%token <string> STRING
%token <string> ID

/* the attribute selectors */
%token TIMES_EQ XOR_EQ DOLLAR_EQ TILDE_EQ

/*Precedence and associativity*/


%start program
%type <Ast.program> program

%%

program:
	pattern EOF {$1}
	
pattern:
	LBRACE_AMP css_selector AMP_RBRACE {CssPattern($2)}
	
css_selector:
	simple_selector_seq {SingleSelector($1)}
	| css_selector PLUS simple_selector_seq {ChainedSelectors($1,DirectSibling,SingleSelector($3))}
	| css_selector GT simple_selector_seq {ChainedSelectors($1,Descendent,SingleSelector($3))}
	| css_selector TILDE simple_selector_seq {ChainedSelectors($1,AnySibling,SingleSelector($3))}
	| css_selector typed_simple_selector_seq {ChainedSelectors($1,DirectChild,SingleSelector($2))}
	
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
	PERIOD ID {ClassMatch($2)}
	| HASH ID {IdMatch($2)}
	| LBRACE ID RBRACE {AttributeExists($2)}
	| LBRACE ID EQ STRING RBRACE {AttributeEquals($2,$4)}
	| LBRACE ID TIMES_EQ STRING RBRACE {AttributeContains($2,$4)}
	| LBRACE ID XOR_EQ STRING RBRACE {AttributeBeginsWith($2,$4)}
	| LBRACE ID DOLLAR_EQ STRING RBRACE {AttributeEndsWith($2,$4)}
	| LBRACE ID TILDE_EQ STRING RBRACE {AttributeWhitespaceContains($2,$4)}
	
