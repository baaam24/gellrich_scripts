#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! PBE0 def2-TZVP def2/J RIJCOSX D3BJ TightSCF Opt Freq"
filetype="inp"
block="%method \n\tGrid 4 \n\tFinalGrid 6 \nend \n\n %geom \n\tMaxstep 0.1 \nend\n "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
#prefix=""
add_comment="TZVP opt-Freq with smaller stepsize"
