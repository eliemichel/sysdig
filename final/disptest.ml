
let k = ref 0 in
let buff = String.create 1 in
	while true do
		incr k;
		match Unix.read Unix.stdin buff 0 1 with
			| 0 -> Printf.printf "End of pipe\n" ; exit 0
			| _ when buff.[0] = '1' -> Printf.printf "\r[-1] %d" !k
			| _                     -> Printf.printf "\r[0-] %d" !k
	done

