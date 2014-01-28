

.PHONY: clean all

all: rapport pres

rapport: rapport.tex
	latex rapport.tex
	dvipdf rapport.dvi

pres: pres.tex
	pdflatex pres.tex

clean:
	@rm -fv *.aux *.dvi *.log *.nav *.out *.snm *.toc


