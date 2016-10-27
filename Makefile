TARGET=homework

all: $(TARGET).pdf

## Generalized rule: how to build a .pdf from each .tex
%.pdf: %.tex $(TARGET).cls
	pdflatex -interaction nonstopmode $<

touch:
	touch *.tex

again: touch all

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb || true

veryclean: clean
	rm -f $(TARGET).pdf

open: $(TARGET).pdf
	if [ "Darwin" = "$(shell uname)" ]; then open $(TARGET).pdf ; else evince $(TARGET).pdf ; fi

.PHONY: all again touch clean veryclean view print
