(*
 * Sysdig -- debug.ml
 * ==================
 *
 * Some debug utilities.
 *)

let print_array f a =
	(** print_array [f] [a] displays the 'a array [a] with the string_of_'a
	function [f] *)
	let n = Array.length a in
		Format.eprintf "[|";
		for k = 0 to n - 1 do
			Format.eprintf "%s"
				(f a.(k))
		done;
		Format.eprintf "|]@."


let print_list f l =
	(** print_list [f] [l] displays the 'a list [l] with the string_of_'a
	function [f] *)
	let rec aux = function
		| []     -> Format.eprintf "]@."
		| [x]    -> (
			Format.eprintf "%s" (f x);
			aux []
			)
		| x :: q -> (
			Format.eprintf "%s%s" (f x) "; ";
			aux q
			)
	in (
		Format.eprintf "[";
		aux l
	)


