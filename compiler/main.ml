open Ast
open Prettyprint

let lexbuf = Lexing.from_channel (open_in Sys.argv.(1));;
let p = Parser.program Scanner.token lexbuf;;
let sp = Sast.tree p;;
print_endline (Prettyprint.string_of_program p);;
