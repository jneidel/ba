all: thesis

thesis: thesis.tex
	pdflatex thesis
	biber thesis
	pdflatex thesis

watch: thesis.tex
	ls thesis.tex | entr -cr make
