# Makefile générant *sim*
CMX=netlist_ast.cmx netlist_parser.cmx netlist_lexer.cmx netlist.cmx netlist_printer.cmx graph.cmx scheduler.cmx core.cmx main.cmx
GEN=netlist_parser.ml netlist_lexer.ml netlist_parser.mli
BIN=sim


NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m


all: $(CMX)
	@echo "Building $(BIN)..."
	ocamlopt -o $(BIN) unix.cmxa $(CMX)
	@echo "$(OK_COLOR)Done.$(NO_COLOR)"


.SUFFIXES: .mli .ml .cmi .cmx .mll .mly

.mli.cmi:
	ocamlopt -c $<

.ml.cmx: 
	ocamlopt -c $<

.mll.ml:
	ocamllex $<

.mly.ml:
	menhir $<

.mly.mli:
	menhir $<

clean:
	@echo "Cleaning directory..."
	@rm -v -f *.cmi *.o *.automaton *~ $(BIN) $(CMX) $(GEN)
	@echo "$(OK_COLOR)Done.$(NO_COLOR)"

.depend: $(GEN)
	rm -f .depend
	ocamldep *.mli *.ml > .depend

include .depend

