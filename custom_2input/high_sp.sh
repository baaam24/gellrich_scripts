#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! DLPNO-CCSD(T) def2-QZVPP NoUseSym  def2-QZVPP/C tightscf TightPNO"
filetype="inp"
block=" "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
#prefix=""
add_comment="TightPNO-DLPNO-CCSD(T)/def2-QZVPP for high level scheme"
