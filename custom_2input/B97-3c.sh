#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! B97-3c TIGHTSCF Opt Freq Grid4 NoFinalGrid"
filetype="inp"
block=" "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
#prefix=""
add_comment="B97-3c optimization for low level scheme"
