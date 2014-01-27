

.PHONY: clean all

all: rapport pres

%: %.tex
	latex $@.tex
	dvipdfmx $@.dvi

clean:
	@rm -fv *.aux *.dvi *.log *.nav *.out *.snm *.toc


