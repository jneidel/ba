all: thesis

thesis: thesis.tex
	pdflatex thesis
	# biber thesis
	# pdflatex thesis
bib:
	biber thesis

watch: thesis.tex
	ls thesis.tex | entr -crp ./make-if-changed
pdf: thesis.pdf
	ls thesis.pdf | entr -r zathura thesis.pdf
	# ls thesis.bbl | entr -r zathura thesis.pdf

clean: thesis.aux
	rm thesis.aux thesis.bbl thesis.bcf thesis.blg thesis.lof thesis.log thesis.lol thesis.lot thesis.run.xml thesis.toc
