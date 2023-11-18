## Build a standalone command line application 
## mkdoc

mdown-files=markdown.tcl pkgIndex.tcl
txutl-files=tabify.tcl repeat.tcl pkgIndex.tcl
tcllib=https://raw.githubusercontent.com/tcltk/tcllib/master/
app:	
	-rm -rf mkdoc.vfs
	tpack init mkdoc.vfs
	rm -rf mkdoc.vfs/lib/test
	cp apps/mkdoc mkdoc.tcl
	mkdir mkdoc.vfs/lib/mkdoc
	cp mkdoc/mkdoc.tcl mkdoc.vfs/lib/mkdoc/
	cp mkdoc/pkgIndex.tcl mkdoc.vfs/lib/mkdoc/
	mkdir mkdoc.vfs/lib/markdown
	mkdir mkdoc.vfs/lib/textutil	
	for file in $(mdown-files); do wget $(tcllib)modules/markdown/$${file} -O mkdoc.vfs/lib/markdown/$${file}; done
	## fix bug for code in triple backtick section
	perl -pe 's/set code_result \[html_escape +.code_result\]//' mkdoc.vfs/lib/markdown/markdown.tcl > temp.tcl
	mv temp.tcl mkdoc.vfs/lib/markdown/markdown.tcl
	
	for file in $(txutl-files); do wget $(tcllib)modules/textutil/$${file} -O mkdoc.vfs/lib/textutil/$${file}; done	
	tpack wrap mkdoc.tapp 
	echo done

test-hightlight:
	./mkdoc.tapp examples/test.md examples/test.html
