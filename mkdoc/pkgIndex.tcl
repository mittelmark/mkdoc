if {![package vsatisfies [package require Tcl] 8.6]} {return}
package ifneeded mkdoc 0.7.1 [list source [file join $dir mkdoc.tcl]]
