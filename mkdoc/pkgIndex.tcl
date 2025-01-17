if {![package vsatisfies [package require Tcl] 8.6-]} {return}
package ifneeded mkdoc 0.11.2 [list source [file join $dir mkdoc.tcl]]
package ifneeded mkdoc::mkdoc 0.11.2 [list source [file join $dir mkdoc.tcl]]
