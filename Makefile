all:
	mkdir -p build
	gitbook pdf . build/book.pdf
	gitbook epub . build/book.epub
	gitbook build . build/html

install:
	gitbook install
