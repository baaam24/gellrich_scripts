#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! PBEh-3c CPCM TIGHTSCF  Grid4 NoFinalGrid"
filetype="inp"
block="%cpcm  \n\tsmd true\n\t smdsolvent \"Benzene\" \n end"

proc=4
mem=2000


### OPTIONAL

#multi=1
#charge=0
prefix="SMD_"
add_comment="PBEh-3c SMD-SP for low level scheme"
