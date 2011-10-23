let string_of_token = function
	  Parser.PLUS   -> "PLUS"
	| Parser.MINUS  -> "MINUS"
	| Parser.TIMES  -> "TIMES"
	| Parser.DIVIDE -> "DIVIDE"
	| Parser.LITERAL(v) -> string_of_int v
	| Parser.EOF -> "EOF"

let rec scan lexbuf =
	let token = Scanner.token lexbuf in
	let s_token = (string_of_token token) in
	if s_token = "EOF"
		then print_endline s_token 
		else let _ = print_endline s_token in
			scan lexbuf

let _ =
	let lexbuf = Lexing.from_channel stdin in
	scan lexbuf
