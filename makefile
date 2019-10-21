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

slides.html : slides.Rmd style.css 
	R --quiet --vanilla -e "rmarkdown::render('$<')"

clean :
	/bin/rm .pkgs
	/bin/rm *.html
