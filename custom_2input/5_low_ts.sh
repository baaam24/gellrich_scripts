#!/bin/bash
# PBEh3-c optimisation (gas phase) for orca5

### NECESSARY 

#program=gaussian
# or 
program=orca

route="! PBEh-3c OptTS Freq defgrid2 TIGHTSCF "
filetype="inp"
block="%geom \n   Calc_Hess true \n   Recalc_Hess 5 \nend \n "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
suffix="_PBEh3c"
prefix="TS_gas_"
add_comment="for orca version 5"
