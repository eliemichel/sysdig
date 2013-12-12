POSTFIX = full

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
HIGHLIGHT_COLOR=\033[1m


.PHONY: clean

clean:
	@echo "Cleaning directory..."
	@rm -v -f *~ *.net
	@echo "$(OK_COLOR)Done.$(NO_COLOR)"

%: %.mj
	./mjdep -o $@_${POSTFIX}.mj $<
	./mjc.byte $@_${POSTFIX}.mj
	./sim -input $@_input.sim -output $@_output.sim -rom $@_rom.sim $@_${POSTFIX}.net
