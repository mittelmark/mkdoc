## Build a standalone command line application 
## mkdoc

yaml-files=pkgIndex.tcl huddle.tcl huddle_types.tcl json2huddle.tcl yaml.tcl
cmdl-files=pkgIndex.tcl cmdline.tcl
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
	mkdir mkdoc.vfs/lib/cmdline
	mkdir mkdoc.vfs/lib/markdown
	mkdir mkdoc.vfs/lib/textutil
	mkdir mkdoc.vfs/lib/yaml	
	for file in $(cmdl-files); do wget $(tcllib)modules/cmdline/$${file} -O mkdoc.vfs/lib/cmdline/$${file}; done	
	for file in $(yaml-files); do wget $(tcllib)modules/yaml/$${file} -O mkdoc.vfs/lib/yaml/$${file}; done	
	for file in $(mdown-files); do wget $(tcllib)modules/markdown/$${file} -O mkdoc.vfs/lib/markdown/$${file}; done
	## fix bug for code in triple backtick section
	perl -pe 's/set code_result \[html_escape +.code_result\]//' mkdoc.vfs/lib/markdown/markdown.tcl > temp.tcl
	mv temp.tcl mkdoc.vfs/lib/markdown/markdown.tcl
	
	for file in $(txutl-files); do wget $(tcllib)modules/textutil/$${file} -O mkdoc.vfs/lib/textutil/$${file}; done	
	tpack wrap mkdoc.tapp --lz4
	cp mkdoc.tapp mkdoc-`tclsh mkdoc.tapp --version`.bin
	ls -lth mkdoc*.bin
	echo done

test-hightlight:
	 ./mkdoc.tapp examples/test.md examples/test.html --javascript highlightjs

docu:
	./mkdoc.tapp mkdoc/mkdoc.tcl mkdoc/mkdoc.html --css mini.css
	htmlark mkdoc/mkdoc.html -o mkdoc/mkdoc-out.html
	mv mkdoc/mkdoc-out.html mkdoc/mkdoc.html
