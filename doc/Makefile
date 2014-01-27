

.PHONY: clean all

all: rapport pres

%: %.tex
	latex $@.tex
	dvipdfmx $@.dvi

clean:
	rm *.aux
	rm *.dvi
	rm *.log


