open Prettyprint

let lexbuf = Lexing.from_channel (open_in "test.hawk");;
let p =  Parser.program Scanner.token lexbuf;;
print_endline (Prettyprint.string_of_program p);;
