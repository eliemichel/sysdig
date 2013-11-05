(*
	Usual debug functions
*)

let print_array f a =
	(** print_array [f] [a] displays the 'a array [a] with the string_of_'a
	function [f] *)
	let n = Array.length a in
		print_string "[|";
		for k = 0 to n - 1 do
			print_string (f a.(k));
			if k < n - 1
			then print_string "; "
		done;
		print_string "|]\n"


let print_list f l =
	(** print_list [f] [l] displays the 'a list [l] with the string_of_'a
	function [f] *)
	let rec aux = function
		| []     -> print_string "]\n"
		| [x]    -> (
			print_string (f x);
			aux []
			)
		| x :: q -> (
			print_string (f x);
			print_string "; ";
			aux q
			)
	in (
		print_string "[";
		aux l
	)


