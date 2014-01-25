all: jupiter
	./jupiter prog_clock.s
	./run


jupiter:
	ocamllex jupiter.mll
	ocamlc -o jupiter jupiter.ml
	rm -f jupiter.cmi jupiter.ml jupiter.cmo

