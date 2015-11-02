open Ast

let _ =
    let lexbuf = Lexing.from_channel stdin in
    Parser.program Scanner.token lexbuf 
