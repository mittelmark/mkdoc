## Build a standalone command line application 
## mkdoc

yaml-files=pkgIndex.tcl huddle.tcl huddle_types.tcl json2huddle.tcl yaml.tcl
cmdl-files=pkgIndex.tcl cmdline.tcl
mdown-files=markdown.tcl pkgIndex.tcl
txutl-files=tabify.tcl repeat.tcl pkgIndex.tcl
tcllib=https://raw.githubusercontent.com/tcltk/tcllib/master/
VERSION=$(shell grep "package ifneeded" mkdoc/pkgIndex.tcl | grep -Eo '[.0-9]{2,}')
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
	for file in $(mdown-files); do cp tcllib/markdown/$${file} mkdoc.vfs/lib/markdown/$${file}; done
	## fix bug for code in triple backtick section
	perl -pe 's/set code_result \[html_escape +.code_result\]//' mkdoc.vfs/lib/markdown/markdown.tcl > temp.tcl
	mv temp.tcl mkdoc.vfs/lib/markdown/markdown.tcl
	
	for file in $(txutl-files); do wget $(tcllib)modules/textutil/$${file} -O mkdoc.vfs/lib/textutil/$${file}; done	
	tpack wrap mkdoc.tapp --lz4
	cp mkdoc.tapp bin/mkdoc-`tclsh mkdoc.tapp --version`.bin
	ls -lth bin/mkdoc*.bin
	echo done

test-hightlight:
	 tclsh ./bin/mkdoc-$(VERSION).bin examples/test.md examples/test.html --javascript highlightjs
test-equations:
	echo $(VERSION)
	tclsh ./bin/mkdoc-$(VERSION).bin examples/equations.md examples/equations.html --mathjax true
	echo done
docu:
	tclsh ./bin/mkdoc-$(VERSION).bin mkdoc/mkdoc.tcl mkdoc/mkdoc.html --css mini.css --mathjax true
	htmlark mkdoc/mkdoc.html -o mkdoc/mkdoc-out.html
	mv mkdoc/mkdoc-out.html mkdoc/mkdoc.html
