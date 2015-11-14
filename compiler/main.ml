open Ast

let lexbuf = Lexing.from_channel (open_in Sys.argv.(1))
let p = Parser.program Scanner.token lexbuf
