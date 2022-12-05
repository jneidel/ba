all: compile

compile: thesis.tex
	pdflatex thesis && cp thesis.pdf /tmp/thesis.pdf
	# biber thesis
	# pdflatex thesis
bib:
	ls bibliography.bib | entr -rp biber thesis

watch: recompile rerender bib
recompile: thesis.tex
	ls thesis.tex | entr -rp ./make-if-changed
rerender: thesis.pdf
	cp thesis.pdf /tmp/thesis.pdf
	ls /tmp/thesis.pdf | entr -r zathura /tmp/thesis.pdf
	# ls thesis.bbl | entr -r zathura thesis.pdf

clean: thesis.aux
	rm thesis.aux thesis.bbl thesis.bcf thesis.blg thesis.lof thesis.log thesis.lol thesis.lot thesis.run.xml thesis.toc
