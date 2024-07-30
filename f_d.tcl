set filelist [glob *.out]
set sortedfilelist [lsort -dictionary $filelist]

set nx  0.60
set ny  0.77
set nz -0.16

foreach file $sortedfilelist {
set filewhext [file rootname $file]
set file [open $file r]
set output [open ${filewhext}_output.dat w]

##SMD Direction



while { [gets $file line] != -1 } {

### Determine if a line contains SMD output. If so, write the
### timestep followed by f(dot)n to the output file
  if {[lindex $line 0] == "SMD"} {
      puts $output "[expr $nx*[lindex $line 2] + $ny*[lindex $line 3] + $nz*[lindex $line 4]] [expr $nx*[lindex $line 5] + $ny*[lindex $line 6] + $nz*[lindex $line 7]]"
    }
  }


close $file
close $output
}