#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! PBE0 def2-TZVP def2/J RIJCOSX D3BJ TightSCF Opt Freq"
filetype="inp"
block=" "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
#prefix=""
add_comment="PBEh-3c optimization for medium level scheme"
