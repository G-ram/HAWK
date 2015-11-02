%{ open Ast %}

%token PERIOD LBRACE RBRACE AMPERSAND LT GT PLUS MINUS TIMES DIV EQ HASH TILDE
%token CSS_PLUS CSS_GT 
%token EOF ID
%token <string> STRING
%token <string> ID

/* the attribute selectors */
%token TIMES_EQ XOR_EQ DOLLAR_EQ TILDE_EQ

/*Precedence and associativity*/
%right CSS_PLUS CSS_GT TILDE


%start program
%type <Ast.program> program

%%

program:
	css_selector EOF {$1}
	
css_selector:
	simple_selector_sequence {SingleSelector($1)}
	| css_selector PLUS css_selector %prec CSS_PLUS {ChainedSelectors($1,direct_sibling,$3)}
	| css_selector GT css_selector %prec CSS_GT {ChainedSelectors($1,descendent,$3)}
	| css_selector TILDE css_selector {ChainedSelectors($1,any_sibling,$3)}
	| simple_selector_sequence css_selector {ChainedSelectors(SingleSelector($1),direct_child,$2)}
	
	
simple_selector_sequence:
	type_selector {($1,[])}
	| type_selector property_selector_list {($1,$2)}
	| property_selector_list {(no_type,$1)}
	
type_selector:
	TIMES {Universal}
	|ID {Elt(ID)}
	
property_selector_list:
	PERIOD ID {ClassMatch($2)}
	| HASH ID {IdMatch($2)}
	| LBRACE ID RBRACE {AttributeExists($2)}
	| LBRACE ID EQ STRING RBRACE {AttributeEquals($2,$4)}
	
	
	
	
