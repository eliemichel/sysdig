let rec create_big_mux nb =
  let nb = int_of_string nb in
  if nb < 2 then
    begin
      Format.eprintf "ERREUR, nb = %d < 2.\n" nb;
      exit 2
    end
  else if nb = 2 then
    Format.printf "big_mux_2(d:[2],c:[1]) = o where\n\to = mux(d[1],d[0],c[0])\nend where\n"
  else
    let lg2n = int_of_float (
      (log (float_of_int nb)) /. (log 2.)) in
    Format.printf "log2(%d) = %d\n" nb lg2n;
    create_big_mux (string_of_int (nb/2));
    Format.printf "big_mux_%d(d:[%d],c:[%d]) = o where\n\to = mux(\n\t\tbig_mux_%d(d[%d..%d],c[0..%d]),\n\t\tbig_mux_%d(d[0..%d],c[0..%d]),\n\t\tc[%d])\nend where\n" nb nb lg2n (nb/2) (nb/2) (nb-1) (lg2n-2) (nb/2) 
(nb/2-1) (lg2n-2) (lg2n-1)

let _ = Arg.parse
  []
  create_big_mux
  "Usage: ocaml big_mux_creator.ml nb"
