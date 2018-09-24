#!/bin/bash
# This is an example file for the creation of input templates.
# every line starting with an '#' will not be read.
# all Variables used in 2input can be specified here:

### NECESSARY 

#program=gaussian
# or 
program=orca




prefix="final_"
route="! PBE0 def2-TZVP def2/J RIJCOSX D3BJ TightSCF Opt Freq"
filetype="inp"
block="%method \n\tGrid 4 \n\tFinalGrid 6 \nend \n\n %geom \n\tMaxstep 0.1 \nend\n "
proc=6
mem=2000
add_comment="TZVP opt-Freq with smaller stepsize"

### OPTIONAL

#multi=1
#charge=0
