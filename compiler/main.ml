open Ast
open Prettyprint

let lexbuf = Lexing.from_channel (open_in Sys.argv.(1)) in
let p = Sast.tree Parser.program Scanner.token lexbuf in
print_endline (Prettyprint.string_of_program p);;
