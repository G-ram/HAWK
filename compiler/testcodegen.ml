let lexbuf = Lexing.from_channel (open_in "test.hawk");;
let p =  Parser.program Scanner.token lexbuf;;
print_endline (Codegen.codegen_program p);;
