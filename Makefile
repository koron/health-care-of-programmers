NAME=$(shell basename $$PWD)

html:
	asciidoctor -D build/html index.adoc

.PHONY: html

pdf:
	asciidoctor-pdf -D build/pdf -r asciidoctor-pdf-cjk \
	  -a pdf-stylesdir=resources/themes -a pdf-style=basic \
	  index.adoc
	perl bin/finish.pl build/pdf/index.pdf build/pdf/$(NAME).pdf
	rm -f build/pdf/index.pdf

.PHONY: pdf

all: html pdf

.PHONY: all

clean:
	rm -rf build

.PHONY: clean
