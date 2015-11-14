ocamllex scanner.mll
ocamlyacc parser.mly
ocamlc -c ast.mli
ocamlc -c prettyprint.ml
ocamlc -c sast.ml
ocamlc -c parser.mli 
ocamlc -c scanner.ml 
ocamlc -c parser.ml 
ocamlc -c codegen.ml
ocamlc -c main.ml 
ocamlc -c testcodegen.ml
ocamlc -c run_test_hawk.ml
ocamlc -o runtesthawk.exe parser.cmo scanner.cmo prettyprint.cmo run_test_hawk.cmo
ocamlc -o testcodegen.exe parser.cmo scanner.cmo codegen.cmo testcodegen.cmo
ocamlc -o main.exe parser.cmo scanner.cmo prettyprint.cmo sast.cmo main.cmo