#!/bin/bash
# This is an example file for the creation of input templates.
# every line starting with an '#' will not be read.
# all Variables used in 2input can be specified here:

### NECESSARY 

#program=gaussian
# or 
program=orca

route="! PBE0 def2-SVP def2/J RIJCOSX D3BJ TightSCF Opt Freq"
filetype="inp"
block="%method \n\tGrid 4 \n\tFinalGrid 6 \nend \n "
proc=6
mem=4000


### OPTIONAL

#multi=1
#charge=0
#suffix=""
#prefix=""
#add_comment="comment"
