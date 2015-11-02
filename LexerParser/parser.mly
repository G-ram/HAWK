%{ open Ast %}

%token PERIOD LBRACE RBRACE AMPERSAND LT GT PLUS MINUS TIMES DIV EQ HASH TILDE
%token CSS_PLUS CSS_GT 
%token EOF 
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
	simple_selector_seq {SingleSelector($1)}
	| css_selector PLUS simple_selector_seq {ChainedSelectors($1,direct_sibling,SingleSelector($3))}
	| css_selector GT simple_selector_seq {ChainedSelectors($1,descendent,SingleSelector($3))}
	| css_selector TILDE simple_selector_seq {ChainedSelectors($1,any_sibling,SingleSelector($3))}
	| css_selector typed_simple_selector_seq {ChainedSelectors($1,direct_child,SingleSelector($2))}
	
simple_selector_seq:
	typed_simple_selector_seq {$1}
	| property_selector_list {(NoType,$1)}

typed_simple_selector_seq:
	type_selector {($1,[])}
	| type_selector property_selector_list {($1,$2)}
	
type_selector:
	TIMES {Universal}
	|ID {Elt(ID)}
	
property_selector_list:
	PERIOD ID {ClassMatch($2)}
	| HASH ID {IdMatch($2)}
	| LBRACE ID RBRACE {AttributeExists($2)}
	| LBRACE ID EQ STRING RBRACE {AttributeEquals($2,$4)}
	
	
	
	
