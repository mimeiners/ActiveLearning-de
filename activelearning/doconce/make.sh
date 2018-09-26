#!/bin/sh -x

language="German"
options=" --encoding=utf-8 --language=$language"
name=index
public=""


set -x
sh -x ./clean.sh

system ()
{
    # Run operating system command and if failure, report and abort
    "$@"
    if [ $? -ne 0 ]; then
	echo "make.sh: unsuccessful command $@"
	echo "abort!"
	exit 1
    fi
}

# Note: since Doconce syntax is demonstrated inside !bc/!ec
# blocks we need a few fixes
editfix ()
{
    # Fix selected backslashes inside verbatim envirs that doconce has added
    # (only a problem when we want to show full doconce code with
    # labels in !bc-!ec envirs as in this presentation).
    # doconce replace '\label{this:section}' 'label{this:section}' $1
    # doconce replace '\label{fig1}' 'label{fig1}' $1
    # doconce replace '\label{demo' 'label{demo' $1
    # doconce replace '\eqref{eq1}' '(ref{eq1})' $1
    # doconce replace '\eqref{myeq}' '(ref{myeq})' $1
    # doconce replace '\eqref{mysec:eq:Dudt}' '(ref{mysec:eq:Dudt})' $1
    doconce replace '[plain,fragile]' '[plain,allowframebreaks]' $1
}

# HTML5 Slides
# html=${name}-reveal-grey
# system doconce format html ${name} --pygments_html_style=native --keep_pygments_html_bg --html_links_in_new_window --html_output=$html $options
# system doconce slides_html ${html} reveal --html_slide_theme=darkgray --copyright=everypage --html_footer_logo=HSB_RGB

# html=${name}-reveal-moon
# doconce format html ${name} --pygments_html_style=fruity --keep_pygments_html_bg SLIDE_TYPE=reveal SLIDE_THEME=moon --html_output=$html $options
# doconce slides_html ${html} reveal --html_slide_theme=moon --copyright=everypage --html_footer_logo=HSB_RGB
# editfix $html.html

# html=${name}-reveal-blue
# doconce format html ${name} --pygments_html_style=default --keep_pygments_html_bg SLIDE_TYPE=reveal SLIDE_THEME=sky --html_output=$html $options

# doconce slides_html ${html} reveal --html_slide_theme=sky --copyright=everypage --html_footer_logo=HSB_RGB
# system doconce format html $name --pygments_html_style=default --keep_pygments_html_bg --html_links_in_new_window --html_output=$html ${options}
# system doconce slides_html $html reveal --html_slide_theme=simple --copyright=titlepage
# editfix $html.html

# deck.js HTML5 slides
# html=${name}-deck-blue
# doconce format html ${name} --pygments_html_style=default --keep_pygments_html_bg SLIDE_TYPE=deck SLIDE_THEME=sandstone.firefox --html_output=$html $options
# doconce slides_html ${html} deck --html_slide_theme=sandstone.firefox --copyright=everypage --html_footer_logo=HSB_RGB
# system doconce format html $name --pygments_html_style=native --keep_pygments_html_bg --html_links_in_new_window --html_output=$html ${options}
# system doconce slides_html $html deck --html_slide_theme=sandstone.default --copyright=everypage
# editfix $html.html

# Plain HTML documents
html=${name}
style=bootswatch_spacelab
# system doconce format html $name --pygments_html_style=perldoc --html_style=solarized3 --html_links_in_new_window --html_output=$html $options
system doconce format html ${name} --pygments_html_style=emacs \
       --html_style=${style} --html_links_in_new_window \
       --html_output=${html} --siunits ${options}
# system doconce split_html ${html}.html --nav_button=gray2,bottom \
#       --font_size=slides --copyright=titlepage

# LaTeX Beamer slides
# theme=blue_shadow
# system doconce format pdflatex ${name} --latex_title_layout=beamer --latex_code_style=pyg --latex_movie=href ${options}
# system doconce slides_beamer ${name} --beamer_slide_theme=$theme
# editfix ${name}-beamer.tex
# system pdflatex -shell-escape ${name}
# system bibtex ${name}
# system pdflatex -shell-escape ${name}
# system pdflatex -shell-escape ${name}
# mv -f ${name}.pdf ${name}-beamer.pdf
# system doconce lightclean

# Beamer handouts
# theme=blue_shadow
# system doconce format pdflatex ${name} --latex_title_layout=beamer --latex_code_style=pyg --latex_movie=href ${options}
# system doconce slides_beamer ${name} --beamer_slide_theme=$theme --handout  # note --handout!
# editfix ${name}.tex
# system pdflatex -shell-escape ${name}
# system bibtex ${name}
# system pdflatex -shell-escape ${name}
# system pdflatex -shell-escape ${name}
# Merge slides to 2x2 per page
# pdfnup --nup 2x2 --frame true --delta "1cm 1cm" --scale 0.9 --outfile ${name}_handout2x2.pdf ${name}.pdf
# mv ${name}.pdf ${name}_handouts2x2.pdf
# system doconce lightclean

# LaTeX documents
# system doconce format pdflatex ${name} --latex_code_style=pyg --latex_font=bera --latex_movie=href ${options}
# system pdflatex -shell-escape ${name}
# system bibtex ${name}
# system pdflatex -shell-escape ${name}
# system pdflatex -shell-escape ${name}
# mv -f ${name}.pdf ${name}-minted.pdf
# system doconce lightclean

# PDF for screen viewing with an alternative look from classic LaTeX
doconce format pdflatex ${name} --latex_font=cmbright \
	--latex_preamble=preamble.tex --siunits \
	--latex_admon=yellowicon '--latex_admon_color=yellow!5' \
	--latex_fancy_header --latex_code_style=pyg \
	--latex_section_headings=blue --latex_colored_table_rows=blue \
	--latex_movie=href ${options}

# doconce replace 'begin{abstract}' 'begin{quote}\small' ${name}.tex
# doconce replace 'end{abstract}' 'end{quote}' ${name}.tex

# system rm -rf ${name}.aux
system pdflatex -shell-escape ${name}
# system bibtex ${name}
# system pdflatex -shell-escape ${name}
system pdflatex -shell-escape ${name}
# mv -f ${name}.pdf ${name}-screen.pdf
# system doconce lightclean

# PDF for printing
# doconce format pdflatex ${name} --device=paper 	--latex_font=palatino \
# 	--latex_title_layout=titlepage --latex_admon=grayicon \
# 	--latex_code_style=pyg --latex_movie=href ${options}

# system pdflatex -shell-escape ${name}
# system bibtex ${name}
# system pdflatex -shell-escape ${name}
# system pdflatex -shell-escape ${name}
# mv -f ${name}.pdf ${name}-printing.pdf
# system doconce lightclean

# XeLaTeX documents
# system doconce format pdflatex ${name} --xelatex --latex_code_style=lst ${options}
# system xelatex ${name}

# Sphinx document
# theme=bootstrap
theme=pyramid
system doconce format sphinx ${name} ${options}
system doconce split_rst ${name}
editfix ${name}.rst
system doconce sphinx_dir theme=${theme} ${name}
system python automake_sphinx.py

# Markdown (pandoc extended)
system doconce format pandoc ${name} ${options}
# system doconce md2latex ${name}
# system doconce md2html ${name} ${options}
# system mv ${name}.html ${name}-pandoc.html
# system pandoc -s -S ${name}.md -o ${name}.docx
# system pandoc ${name}.md -o ${name}.odt
# system pandoc ${name}.md --latex-engine=xelatex -o ${name}-pandoc.pdf

# using pandoc to go from LaTeX to MS Word or HTML
# system doconce format latex ${name} ${options}
# system ptex2tex ${name}
# system doconce replace '\Verb!' '\verb!' ${name}.tex
# system pandoc -f latex -t docx -o ${name}.docx ${name}.tex


# IPython notebook
ipynb_figure=imgtag
ipynb_movie=ipynb
ipynb_admon=hrule
nbv=3
# system doconce format ipynb ${name} --encoding=utf-8
# pygmentize -l json -o ${name}.ipynb.html ${name}.ipynb

doconce format ipynb ${name} --no_preprocess \
    --ipynb_figure=${ipynb_figure} ipynb_figure=${ipynb_figure} \
    --ipynb_movie=${ipynb_movie} ipynb_movie=${ipynb_movie} \
    --ipynb_admon=${ipynb_admon} ipynb_admon=${ipynb_admon} \
    --ipynb_version=$nbv \
    ${options}
# Must fix instructions since doconce performs certain actions for
# some of the code segments we demonstrate
doconce subst '" +%matplotlib inline\\n",\n +" +\\n",\n +' '' ${name}.ipynb
doconce subst '"import numpy as np\\n"', '"%matplotlib inline\\n",\n "import numpy as np\\n",' ${name}.ipynb
doconce subst 'Plot\. \\\\label' 'Plot. label' ${name}.ipynb


# system doconce format mwiki ${name} ${options}
# system doconce format pandoc ${name} ${options}
# system pandoc -R -t mediawiki -o ${name}.mwk --toc ${name}.md

