MAKEFLAGS += --no-print-directory

default: once
once:
	$(MAKE) compile && $(MAKE) render

# latex
compile_tex: thesis.tex
	xelatex -shell-escape thesis
compile_short: thesis.tex
	$(MAKE) compile_tex && \
	$(MAKE) copy_pdf
compile: thesis.tex
	$(MAKE) compile_tex && \
	$(MAKE) compute_bib && \
	$(MAKE) compile_short

# pdf
copy_pdf: thesis.pdf
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
	$(MAKE) compute_bib
bib: import_bib

# watch
watch: recompile rerender
recompile: thesis.tex
	ls thesis.tex 2>/dev/null | entr -rp ./make-if-changed
rerender: thesis.pdf
	$(MAKE) copy_pdf
	ls /tmp/thesis.pdf | entr -r zathura /tmp/thesis.pdf
recompute: bibliography.bib
	ls bibliography.bib | entr -rp $(MAKE) compute_bib

# cleanup
clean:
	rm thesis.aux thesis.bcf thesis.lof thesis.log thesis.lol thesis.lot thesis.run.xml thesis.toc 2>/dev/null # thesis.bbl thesis.blg
