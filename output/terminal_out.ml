
(* 11111100110011011000011011010110000111101111110111111001110110111110011111110101101101100001101101 *)

#load "unix.cma";;

let int_of_7seg = function
	| "1111110" -> 0
	| "0110000" -> 1
	| "1101101" -> 2
	| "1111001" -> 3
	| "0110011" -> 4
	| "1011011" -> 5
	| "1011111" -> 6
	| "1110000" -> 7
	| "1111111" -> 8
	| "1111011" -> 9
	| _ -> -1
in

let s = ref "" in
let buff = String.create 1 in
	while true do
		s := "";
		while String.length !s < 7 * 14 + 1 do
			match Unix.read Unix.stdin buff 0 1 with
				| 0 -> Format.printf "\nClose output (End of pipe)@." ; exit 0
				| n -> s := !s ^ buff
		done;
		let aux i = (int_of_7seg (String.sub !s (7 * i + 1) 7)) in
			
			Format.printf "\r%d%d/%d%d/%d%d%d%d  %d%d:%d%d:%d%d@?"
				(aux 7) (aux 6) (aux 9) (aux 8) (aux 11) (aux 10) (aux 13) (aux 12)
				(aux 5) (aux 4) (aux 3) (aux 2) (aux 1) (aux 0)
			
			(*Printf.printf "%d\n" (aux 0)*)
	done


