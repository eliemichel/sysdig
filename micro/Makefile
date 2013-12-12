
POSTFIX = full


%: %.mj
	./mjdep -o $@_${POSTFIX}.mj $<
	./mjc.byte $@_${POSTFIX}.mj
	./sim $<.net
