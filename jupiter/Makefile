all: jupiter
	./preprocess.sh
	./jupiter prog_clock.s
	(cd ../final;./run)


jupiter:
	ocamllex jupiter.mll
	ocamlc -o jupiter jupiter.ml
	rm -f jupiter.cmi jupiter.ml jupiter.cmo

