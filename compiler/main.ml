let lexbuf = Lexing.from_channel (open_in Sys.argv.(1))
let p = Sast.tree Parser.program Scanner.token lexbuf
