#!/bin/sh -x
name=$1
set -x
sh -x ./clean.sh ${name}

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

language="German"
options=" --encoding=utf-8 --language=$language"
public="elite:/home/mimeiners/public_html"

fixarticle ()
{
    # doconce replace '{article}' '{extarticle}' $1
    doconce replace '\section{' '\section*{' $1
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
    doconce replace '\title{' '\title[ELK]{' $1
    doconce replace '\author' '\author[M. Meiners]' $1
    doconce replace '\institute' '\institute[HSB]' $1
    doconce replace '[plain,fragile]' '[fragile]' $1
}


# IPython notebook
ipynb_figure=imgtag
ipynb_movie=ipynb
ipynb_admon=hrule
nbv=3

doconce format ipynb ${name} \
	--no_preprocess \
	--ipynb_figure=${ipynb_figure} ipynb_figure=${ipynb_figure} \
	--ipynb_movie=${ipynb_movie} ipynb_movie=${ipynb_movie} \
	--ipynb_admon=${ipynb_admon} ipynb_admon=${ipynb_admon} \
	--ipynb_version=$nbv \
	${options}
#	--without_solutions

# HTML5 Slides
# html=${name}-reveal-grey
# system doconce format html ${name} --pygments_html_style=native --keep_pygments_html_bg --html_links_in_new_window --html_output=$html $options
# system doconce slides_html ${html} reveal --html_slide_theme=darkgray --copyright=everypage --html_footer_logo=HSB_RGB

# html=${name}-reveal-moon
# doconce format html ${name} --pygments_html_style=fruity --keep_pygments_html_bg SLIDE_TYPE=reveal SLIDE_THEME=moon --html_output=$html $options
# doconce slides_html ${html} reveal --html_slide_theme=moon --copyright=everypage --html_footer_logo=HSB_RGB
# editfix $html.html

# html=${name}-reveal-blue
# system doconce format html ${name} --pygments_html_style=default --keep_pygments_html_bg  SLIDE_TYPE=reveal SLIDE_THEME=sky --html_output=$html $options
# system doconce slides_html ${html} reveal --html_slide_theme=sky --copyright=everypage --html_footer_logo=HSB_RGB
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
# system doconce format html $name \
#        --pygments_html_style=perldoc \
#        --html_style=solarized3 \
#        --html_links_in_new_window \
#        --html_output=$html $options
system doconce format html ${name} \
       --pygments_html_style=emacs \
       --html_style=${style} \
       --html_links_in_new_window \
       --html_output=${html} \
       ${options}
# system doconce split_html ${html}.html --nav_button=gray2,bottom \
#       --font_size=slides --copyright=titlepage

# LaTeX documents
# system doconce format pdflatex ${name} \
#        --latex_code_style=pyg \
#         --latex_font=bera \
#         --latex_movie=href \
#         ${options}
#system pdflatex -shell-escape ${name}
#system bibtex ${name}
#system pdflatex -shell-escape ${name}
#system pdflatex -shell-escape ${name}
#mv -f ${name}.pdf ${name}-minted.pdf
#system doconce lightclean

# PDF for screen viewing with an alternative look from classic LaTeX
doconce format pdflatex ${name} \
 	--latex_font=lmodern \
 	--latex_admon=yellowicon '--latex_admon_color=yellow!5' \
 	--latex_fancy_header --latex_code_style=pyg --siunits \
 	--latex_section_headings=blue --latex_colored_table_rows=blue \
 	--latex_movie=href \
	--latex_preamble=preamble.do_tex \
 	${options}
#	--without_solutions
# fixarticle ${name}.tex
system pdflatex -shell-escape ${name}
# system bibtex ${name}
# system pdflatex -shell-escape ${name}
system pdflatex -shell-escape ${name}
# mv -f ${name}.pdf ${name}-screen.pdf
# system doconce lightclean

# PDF for printing
# doconce format pdflatex ${name} \
#	--device=paper \
# 	--latex_font=cmbright \
# 	--latex_title_layout=titlepage --latex_admon=grayicon \
# 	--latex_code_style=pyg --siunits \
#	--latex_movie=href ${options}

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
# theme=pyramid
# theme=sphinxdoc
# theme=hsb2
# system doconce format sphinx ${name} --sphinx_keep_splits --encoding=utf-8
# system doconce format sphinx ${name} --encoding=utf-8
# system doconce split_rst ${name}
# system doconce sphinx_dir theme=${theme} ${name}
# system python automake_sphinx.py

# Markdown (pandoc extended)
# system doconce format pandoc ${name} --encoding=utf-8 \
#       --strict_markdown_output
#       --github_md
#       --multimarkdown_output \
#       --strapdown --bootstrap_bootwatch_theme=slate
# system doconce md2latex ${name}
# system doconce md2html ${name}
# system mv ${name}.html ${name}-pandoc.html
# system pandoc -f markdown+smart -t docx-smart ${name}.md -o ${name}.docx
# system pandoc -f markdown+smart -t odt-smart ${name}.md -o ${name}.odt
# system pandoc ${name}.md --pdf-engine=xelatex -o ${name}-pandoc.pdf
# system odpdown --break-master=break_slide --content-master=content_slides \
#        ${name}.md hsb_template.odp ${name}.odp
# Taken from R Markdown (knitr)
# system pandoc +RTS -K512m -RTS ${name}.md --to pptx \
#        --from markdown+autolink_bare_uris+tex_math_single_backslash \
#        --output ${name}.pptx

# using pandoc to go from LaTeX to MS Word or HTML
# system doconce format latex ${name} ${options}
# system ptex2tex ${name}
# system doconce replace '\Verb!' '\verb!' ${name}.tex
# system pandoc -f latex -t docx -o ${name}.docx ${name}.tex

# Producing epub
# system pandoc -f markdown+smart -t epub3+smart \
#        --epub-metadata ${name}-meta.yml \
#        --css ${name}-style.css \
#        --epub-cover-image ./fig/${name}-cover2.jpg \
#        -o ${name}.epub \
#        ${name}.md

# Construction of lab folder
system mkdir -p ${name}/{code,fig}
system tar -xzf ipynb-${name}-src.tar.gz -C ./${name}/
# system cp ../source/img/${name}*.png ./${name}/fig/
system mv ${name}.pdf ./${name}/
system mv ${name}.ipynb ./${name}/
system cp ${name}.html ./${name}/
system ln -s ${name}.html ./${name}/index.html
system find ./${name} -type f -exec chmod 644 {} \;
system find ./${name} -type d -exec chmod 755 {} \;
# system zip -r ${name}.zip ./${name}
# system rsync -rtvluz -e ssh ./${name} ${public}/elk/lab/ --delete-before
