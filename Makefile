default: once
once: compile render

# latex
compile_tex: thesis.tex
	pdflatex thesis
compile: thesis.tex
	make compile_tex && \
		make compute_bib && \
		make compile_tex && \
		make copy_pdf

# pdf
copy_pdf: /tmp/thesis.pdf
	cp thesis.pdf /tmp/thesis.pdf 2>/dev/null
render:
	make copy_pdf
	zathura /tmp/thesis.pdf
pdf: render

# bibliography
compute_bib:
	biber thesis
import_bib:
	/bin/pubs -c ~/projects/uni/z_ba/pubs/pubsrc export >bibliography.bib
	make compute_bib
bib: import_bib

# watch
watch: recompile rerender
recompile: thesis.tex
	ls thesis.tex 2>/dev/null | entr -rp ./make-if-changed
rerender: thesis.pdf
	make copy_pdf
	ls /tmp/thesis.pdf | entr -r zathura /tmp/thesis.pdf
recompute: bibliography.bib
	ls bibliography.bib | entr -rp make compute_bib

# cleanup
clean:
	rm thesis.aux thesis.bcf thesis.lof thesis.log thesis.lol thesis.lot thesis.run.xml thesis.toc 2>/dev/null # thesis.bbl thesis.blg
