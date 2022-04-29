VERSION=$(shell tclsh mkdoc.tcl --version)

mkdoc:
	dtplite -o mkdoc.html html mkdoc.man
	tclsh ../apps/mkdoc mkdoc.tcl mkdoc.md
	tclsh ../apps/mkdoc mkdoc.tcl mkdoc-mkdoc.html
