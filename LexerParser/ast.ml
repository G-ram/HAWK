type combinator = direct_child | descendent | direct_sibling | any_sibling

type property_selector =
	ClassMatch of string
	| IdMatch of string 
	| AttributeExists of string 
	| AttributeEquals of string * string
	| AttributeContains of string * string
	| AttributeBeginsWith of string * string
	| AttributeEndsWith of string * string
	| AttributeWhitespaceContains of string * string
	
type type_selector = 
	Elt of string
	| Universal
	| NoType
	
type simple_selector_sequence =
	type_selector * (property_selector list)

type css_selector = 
	SingleSelector of simple_selector_sequence
	| ChainedSelectors of css_selector * combinator * css_selector
	
type program = css_selector

	
