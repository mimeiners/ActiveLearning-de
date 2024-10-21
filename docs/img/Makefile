# Examples makefile.
#
# Type "make" to generate examples.ps containing many examples.
# Type "make <diag>.ps" to make a postscript file from <diag>.m4
# Type "make <diag>.eps" to make an .eps file from <diag>.m4
# Type "make <diag>.pdf" to make a .pdf file from <diag>.m4
# Type "make <diag>.png" to make a .png file from <diag>.m4
#   (uses ImageMagick convert)
#
# To test the file test.m4, type "make tst" if boxdims is used, otherwise
# type "make tst1".  In either case the file tst.ps is created.
#
# To debug a single diagram in a directory other than the examples
# directory of the distribution, copy this makefile and tst.tex
# to where you want to work, redefine LIBDIR (below) appropriately,
# and type "make <diag>.xxx" where xxx is one of ps, eps, png, or pdf

# Circuit_macro directory, change this if necessary:
# LIBDIR = $$HOME/lib
# LIBDIR = ..
LIBDIR = $(HOME)/texmf-local/Circuit_macros

# The dpic processor:
# PIC = $(HOME)/texmf-local/dpic/dpic -p
PIC = $(HOME)/texmf-local/dpic/dpic

# Config for PSTricks
# CONFIGFILE = pstricks.m4

# Config for Tikz/PGF output
CONFIGFILE = pgf.m4

M4 = m4 -I $(LIBDIR)

#########################################################################

DVIPSOPTS = -Ppdf -G0 -t letter
PNGOPTS = -density 300 -quality 90
M4LIBS = $(CONFIGFILE) $(LIBDIR)/libcct.m4

DIMFILE =
LTX = latex --shell-escape
BS = tr '|' '\134'

.SUFFIXES: .ps .dvi .tex *.tikz .m4 .pic .eps .png .pdf .svg .tif .gif

.dvi.ps:
	dvips $(DVIPSOPTS) $* -o $*.ps
	chmod 640 $*.ps

.m4.tex:
	@if test -n "$(DIMFILE)" ; then touch $(DIMFILE) ; fi ; touch F$*.dim
	$(M4) $(M4LIBS) $(DIMFILE) F$*.dim $*.m4 > $*.pic
	$(PIC) -g $*.pic > $*.tex

.m4.pic:
	@if test -n "$(DIMFILE)" ; then touch $(DIMFILE) ; fi
	$(M4) $(M4LIBS) $(DIMFILE) $*.m4 > $*.pic

.m4.dvi:
	make $*.tex
	printf "|documentclass[11pt]{article}\n\
|usepackage{times,pgf,tikz,pgfplots,boxdims,graphicx}\n\
|setlength{|textwidth}{28cm}|setlength{|textheight}{28cm}\n\
|setlength{|oddsidemargin}{0pt}|setlength{|evensidemargin}{0pt}\n\
|setlength{|hoffset}{-1cm}\n\
|pagestyle{empty}|thispagestyle{empty}\n\
|newbox|graph\n\
|begin{document}\n\
|noindent|input{"$*".tex}\n\
|end{document}\n" | $(BS) > F$*.tex
	latex F$*
	touch F$*.dim $(DIMFILE) ; rm -f $*.tex $*.pic ; make $*.tex
	latex F$*
	touch F$*.dim $(DIMFILE) ; rm -f $*.tex $*.pic ; make $*.tex
	latex F$*

.m4.eps:
	make $*.dvi
	dvips -Ppdf F$* -T128cm,28cm -o $*.ps
	# Recent changes to PSTricks(?) have clashed with the use of TeXtoEPS
	# so use ps2epsi
	ps2epsi $*.ps $*.epsi
	sed -e '/%%Pages:/d' -e '/BeginPreview/,$$d' $*.epsi \
		| tr '\015' '\012' > $*.eps
	sed -e '1,/EndPreview/d' $*.epsi >> $*.eps

.m4.ps:
	make $*.tex && mv $*.tex test.tex; latex tst
	rm -f test.tex $*.pic
	if test -f tst.dim ; then cp tst.dim F$*.dim ; fi
	make $*.tex && mv $*.tex test.tex; latex tst
	dvips $(DVIPSOPTS) tst -o $*.ps
	chmod 640 $*.ps

.m4.svg:
	make $*.eps
	convert $(EPSOPTS) $*.eps $*.svg

# .m4.png:
#	make $*.eps
#	convert $(PNGOPTS) $*.eps $*.png
#	@if test -f $*.png.0 ; then mv $*.png.0 $*.png ; fi

.m4.png:
	make $*.pdf
	convert $(PNGOPTS) $*.pdf $*.png

.m4.gif:
	make $*.ps
	convert $(GIFOPTS) $*.ps $*.gif
#	@if test -f $*.png.0 ; then mv $*.png.0 $*.png ; fi

.m4.tif:
	make $*.eps
	convert $(EPSOPTS) $*.eps $*.tif
	@if test -f $*.tif.0 ; then mv $*.tif.0 $*.tif ; fi

.m4.pdf:
	$(M4) pgf.m4 libcct.m4 $*.m4 > $*.pic
	$(PIC) -g $*.pic > test.tex
	sed -e '/^\\usepackage.*graphicx/s/^.*$$/\\usepackage{pgf,tikz,pgfplots}/' \
        -e '/pstricks/d' \
	$(LIBDIR)/examples/tst.tex > F$*.tex
	pdflatex F$*
	$(M4) pgf.m4 libcct.m4 $*.m4 > $*.pic
	$(PIC) -g $*.pic > test.tex
	pdflatex F$*
	pdfcrop F$*.pdf $*.pdf	
	rm -f F$*
#	-e 's/documentclass[11pt]{article}/documentclass[border=10pt]{standalone}/' \
#	mv F$*.pdf $*.pdf

.tikz.png:
	pdflatex $*.tikz
	convert $(PNGOPTS) $*.pdf $*.png
	convert $*.pdf $*.svg

clean:
	rm -f *.tex  *.dvi *.aux *.log *.toc *.blg core snapshots *.eps eps *-mfpic*
	rm -f F*.tex *.roff *.int *.pic gpic.m4 test.tex xxx* *.fig *.epsi *.ps
	rm -f *.dim *.bak *.frs $(RPICS) rotate.ps tst.ps *.bbl *-pics.ps
	rm -f *.tfm *[0-9]pk quick.tex quick.pic *.1 *.synctex.*
	rm -rf auto
