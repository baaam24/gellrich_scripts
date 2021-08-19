#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! PBEh-3c TIGHTSCF Opt Freq Grid4 NoFinalGrid CPCM "
filetype="inp"
block="%cpcm\n   smd true\n   smdsolvent \"dichloromethane\"\nend "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
#prefix="SMD_opt"
add_comment="PBEh-3c optimization with SMD for low level scheme - e.g. surrogates"
