CRAN = 'https://cran.rstudio.com'

all : .pkgs slides.html

.pkgs :
	R --quiet --vanilla -e "options(repos = $(CRAN))"\
		-e "if (!('devtools' %in% rownames(installed.packages()))) {install.packages('devtools')}"\
		-e "devtools::install_cran('knitr')"\
		-e "devtools::install_cran('rmarkdown')"
	touch .pkgs

slides.Rmd : slides.R
	R --quiet --vanilla -e "knitr::spin('$<', knit = FALSE)"

slides.html : slides.Rmd style.css tree1.txt.html
	R --quiet --vanilla -e "rmarkdown::render('$<')"

tree1.txt.html : tree1.txt
	nvim -c TOhtml -c wqa $<

clean :
	/bin/rm .pkgs
	/bin/rm *.html
