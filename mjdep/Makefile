CMX=main.cmx
GEN=main.ml
LIBS = unix.cmxa
BIN=mjdep


NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
HIGHLIGHT_COLOR=\033[1m

all: $(BIN)
	@echo "$(HIGHLIGHT_COLOR)  ./$(BIN) --help$(NO_COLOR)"
	@./$(BIN) --help

$(BIN): $(CMX)
	@echo "Linking for $(BIN)..."
	@ocamlopt -o $(BIN) $(LIBS) $(CMX)
	@echo "$(OK_COLOR)Done.$(NO_COLOR)"

.SUFFIXES: .mli .ml .cmi .cmx .mll

.mli.cmi:
	ocamlopt -c $<

.ml.cmx: 
	ocamlopt -c $<

.mll.ml:
	ocamllex $<

.PHONY: clean all

clean:
	@echo "Cleaning directory..."
	@rm -v -f .depend *.cmi *.o *.automaton *~ $(CMX) $(GEN)
	@echo "$(OK_COLOR)Done.$(NO_COLOR)"

.depend: $(GEN)
	rm -f .depend
	ocamldep *.mli *.ml > .depend

ifneq ($(MAKECMDGOALS),clean)
include .depend
endif

