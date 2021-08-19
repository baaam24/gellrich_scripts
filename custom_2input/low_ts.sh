#!/bin/bash

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! PBEh-3c TIGHTSCF OptTS Freq Grid4 NoFinalGrid"
filetype="inp"
block="%geom \n\tCalc_Hess true\n\tRecalc_Hess 5\nend\n "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
prefix="TS_"
add_comment="PBEh-3c TS-optimization for low level scheme"
