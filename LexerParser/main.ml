open Ast

let comb_string comb = match comb with
	DirectChild -> "DC"
	| Descendent -> ">"
	| DirectSibling -> "+"
	| AnySibling -> "~";;

let print_selector sel = match sel with
	_ -> print_string "Selector";;

let rec test_css_pattern pat = match pat with
	SingleSelector(sequence) -> print_selector sequence
	| ChainedSelectors(pat1,combinator,sel) ->
		print_string "("; test_css_pattern pat1; print_string ")"; print_string (comb_string combinator); ignore (print_selector sel);;

let test_pattern p = match p with 
	CssPattern(pat) -> test_css_pattern pat
	| _ -> ();;
	
let test_program p = 
	List.iter test_pattern (List.map fst p.pattern_actions);;
	
let lexbuf = Lexing.from_channel (open_in "test.hawk") in
let p = Parser.program Scanner.token lexbuf in
test_program p
	