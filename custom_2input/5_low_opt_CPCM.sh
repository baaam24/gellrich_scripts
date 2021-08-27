#!/bin/bash
# PBEh3-c optimisation (gas phase) for orca5

### NECESSARY 

#program=gaussian
# or 
program=orca

route="! PBEh-3c Opt Freq defgrid2 TIGHTSCF CPCM(CH2Cl2) "
filetype="inp"
#block=" "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
suffix="_PBEh3c"
prefix="opt_CPCM__"
add_comment="for orca version 5"
