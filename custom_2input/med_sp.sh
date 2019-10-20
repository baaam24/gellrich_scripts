#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! DLPNO-CCSD(T) def2-TZVP NoUseSym  def2-TZVP/C tightscf TightPNO"
filetype="inp"
block=" "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
#prefix=""
add_comment="TightPNO-DLPNO-CCSD(T)/def2-TZVP for medium level scheme"
