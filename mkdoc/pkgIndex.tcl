if {![package vsatisfies [package require Tcl] 8.6]} {return}
package ifneeded mkdoc 0.9.0 [list source [file join $dir mkdoc.tcl]]
