VERSION=$(shell tclsh mkdoc.tcl --version)

mkdoc:
	dtplite -o mkdoc.html html mkdoc.man
	## markdown lib can't handle triple tick blocks currently
	tclsh ../bin/mkdoc-0.8.0.bin mkdoc.tcl mkdoc.md 
	tclsh ../bin/mkdoc-0.8.0.bin mkdoc.tcl mkdoc-mkdoc.html --css mkdoc.css
