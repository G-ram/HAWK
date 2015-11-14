open Ast
open Prettyprint
	
let lexbuf = Lexing.from_channel (open_in "test.hawk") in
let p = Parser.program Scanner.token lexbuf in
print_endline (Prettyprint.string_of_program p);;
	