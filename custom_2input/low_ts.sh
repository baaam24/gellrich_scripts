#!/bin/bash

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! PBEh-3c TIGHTSCF OptTS Freq Grid4 NoFinalGrid"
filetype="inp"
block=" "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
prefix="TS"
add_comment="PBEh-3c TS-optimization for low level scheme"
