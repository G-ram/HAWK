open Ast

let test_program p =
	List.iter test_pattern (List.map fst p.pattern_actions);;

let lexbuf = Lexing.from_channel (open_in Sys.argv.(1)) in
let p = Parser.program Scanner.token lexbuf in

test_program p
