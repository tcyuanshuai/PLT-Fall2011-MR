{ open Parser }
rule token =
	parse [' ' '\t' '\r' '\n'] { token lexbuf }
		| "PLUS" { PLUS }
		| "MINUS" { MINUS }
		| "TIMES" { TIMES }
		| "DIVIDE" { DIVIDE }
		| ['0'-'9']+ as lit { LITERAL(int_of_string lit) }
		| "EOF" { EOF }
