POSTFIX = full

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
HIGHLIGHT_COLOR=\033[1m


.PHONY: clean

clean:
	@echo "Cleaning directory..."
	@rm -v -f *~ *.net *_${POSTFIX}.mj
	@echo "$(OK_COLOR)Done.$(NO_COLOR)"


%: %.mj
	@echo "${WARN_COLOR}  ./mjdep -o $@_${POSTFIX}.mj $<${NO_COLOR}"
	@./mjdep -o $@_${POSTFIX}.mj $<
	@echo "${WARN_COLOR}  ./mjc.byte $@_${POSTFIX}.mj${NO_COLOR}"
	@./mjc.byte $@_${POSTFIX}.mj
	@echo "${WARN_COLOR}  ./sim --schedule-only $@_${POSTFIX}.net${NO_COLOR}"
	@./sim --schedule-only $@_${POSTFIX}.net
#./sim --sim-only -rom $@.bin $@_${POSTFIX}.sch.net


