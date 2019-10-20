#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! PBE0 def2-TZVP def2/J RIJCOSX D3BJ TightSCF Opt Freq"
filetype="inp"
block="%method \n\tGrid 4 \n\tFinalGrid 6 \nend  "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
#prefix=""
add_comment="PBE0-D3(BJ)/def2-TZVP optimization for high level scheme"
