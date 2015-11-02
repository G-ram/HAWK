%{ open Ast %}

%token PERIOD LBRACE RBRACE AMPERSAND LT GT PLUS MINUS TIMES DIV EQ HASH TILDE
%token CSS_PLUS CSS_GT 
%token EOF ID
%token <string> STRING
%token <string> ID

(* the attribute selectors *)
%token TIMES_EQ XOR_EQ DOLLAR_EQ TILDE_EQ

/*Precedence and associativity*/
%right CSS_PLUS CSS_GT TILDE


%start program
%type <Ast.program> program

%%

program:
	css_selector EOF
	
css_selector:
	simple_selector_sequence {single_selector($1)}
	| css_selector PLUS css_selector %prec CSS_PLUS {chained_selectors($1,direct_sibling,$3)}
	| css_selector GT css_selector %prec CSS_GT {chained_selectors($1,descendent,$3)}
	| css_selector TILDE css_selector {chained_selectors($1,any_sibling,$3)}
	| simple_selector_sequence css_selector {chained_selectors(single_selector($1),direct_child,$2)}
	
	
simple_selector_sequence:
	type_selector {($1,[])}
	| type_selector property_selector_list {($1,$2)}
	| property_selector_list {(no_type,$1)}
	
type_selector:
	TIMES {universal_selector}
	|ID {elt(ID)}
	
property_selector_list:
	PERIOD ID {class_match($2)}
	HASH ID {id_match($2)}
	LBRACE ID RBRACE {attribute_exists($2)}
	LBRACE ID EQUALS STRING RBRACE {attribute_equals($2,$4)}
	
	
	
	
