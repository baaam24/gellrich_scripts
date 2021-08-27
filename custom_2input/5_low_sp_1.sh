#!/bin/bash
# This is an example file for the creation of input templates.
# every line starting with an '#' will not be read.
# all Variables used in 2input can be specified here:

### NECESSARY 

#program=gaussian
# or 
program=orca

route="! PBE0 def2-QZVPP D4 RIJCOSX def2/J TightSCF defgrid2"
filetype="inp"
block=" "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
suffix="_PBE0-D4_def2QZVPP"
prefix="SP_"
#add_comment="comment"
