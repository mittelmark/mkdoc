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
	TCLLIBPATH=`pwd` tclsh apps/mkdoc mkdoc/mkdoc.tcl mkdoc/mkdoc.html --css mini.css --mathjax true --javascript highlightjs
	#htmlark --ignore-js mkdoc/mkdoc.html -o mkdoc/mkdoc-out.html
	#cp mkdoc/mkdoc-out.html mkdoc/mkdoc.html
tests:
	@echo "Running tests..."
	@TCLLIBPATH=`pwd` tclsh apps/mkdoc examples/hilight.md examples/hilight.html --javascript highlightjs && grep -q "highlight.min.js" examples/hilight.html || (echo "Error: Expected highlightjs output not found"; exit 1) && echo "  ... highlight passing"
	@TCLLIBPATH=`pwd` tclsh apps/mkdoc examples/hilight.md examples/hilight-refresh.html --refresh 10 && grep -qE "http-equiv=.refresh.+10" examples/hilight-refresh.html || (echo "Error: Expected refresh output not found"; exit 1) && echo "  ... refresh passing"	
	@echo -e "---\ntitle: test-title\nauthor: NN\ndate: 2024-11-20\n---\n\nhello\n\n" > test.md
	@TCLLIBPATH=`pwd` tclsh apps/mkdoc test.md test.html
	@grep -qE "<h1 class=\"title\">test-title</h1>" test.html || (echo "Error: Expected title output not found"; exit 1) && echo "  ... title passing"
	@grep -qE "<h2 class=\"date\">2024-11-20</h2>" test.html || (echo "Error: Expected date output not found"; exit 1) && echo "  ... date passing"
	@grep -qE "<h2 class=\"author\">NN</h2>" test.html || (echo "Error: Expected author output not found"; exit 1) && echo "  ... author passing"
	@grep -qE "<p>hello</p>" test.html || (echo "Error: Expected paragraph output not found"; exit 1) && echo "  ... paragraph passing"
	@cp test.html hello.html
	@cp test.md hello.md
	@echo "## header" > test.md
	@TCLLIBPATH=`pwd` tclsh apps/mkdoc test.md test.html && grep -qE "<h2>header</h2>" test.html || (echo "Error: Expected header output not found"; exit 1) && echo "  ... header passing"
	@echo "Tests passed successfully!"
run:
	@TCLLIBPATH=`pwd` tclsh apps/mkdoc mkdoc.tcl --run
