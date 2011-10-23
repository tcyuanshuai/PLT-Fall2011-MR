open Ast

let rec indent_aux times result = 
	if times = 0
	then result
	else (indent_aux (times-1) (result ^ "\t"))

let indent times =
	indent_aux times ""

let rec print_tree expr depth = 
	match expr with
		Lit(x) -> print_endline ((indent depth) ^ (string_of_int x))
  	  | Binop(e1, op, e2) ->
		let _ = print_string ((indent depth) ^ "Binop:") in
		let _ = match op with
			  Add -> print_endline "Add"
			| Sub -> print_endline "Sub"
			| Mul -> print_endline "Mul"
			| Div -> print_endline "Div"
		in print_tree e1 (depth+1) ; print_tree e2 (depth+1)

let _ =
	let lexbuf = Lexing.from_channel stdin in
	let expr = Parser.expr Token_scanner.token lexbuf 
    in print_tree expr 0
