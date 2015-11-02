type combinator = direct_child | descendent | direct_sibling | any_sibling

type property_selector =
	class_match of string
	| id_match of string 
	| attribute_exists of string 
	| attribute_equals of string * string
	| attribute_contains of string * string
	| attribute_beginswith of string * string
	| attribute_endswith of string * string
	| attribute_whitespace_contains of string * string
	
type type_selector = 
	elt of string
	| universal_selector
	| notype
	
type simple_selector_sequence =
	type_selector * (property_selector list)

type css_selector = 
	single_selector of simple_selector_sequence
	| chained_selectors of css_selector * combinator * css_selector
	
type program = css_selector

	
