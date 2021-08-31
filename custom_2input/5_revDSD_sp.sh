#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="!  RKS def2-QZVPP def2-QZVPP/c def2/JK TIGHTSCF RIJK defgrid2 NoPOP d4"
filetype="inp"
block="%method\nFrozenCore FC_ELECTRONS\n Exchange X_PBE\n Correlation C_P86\nScalHFX 0.69\nScalDFX 0.31\nScalGGAC 0.4210\nScalLDAC 0.4210\n ScalMP2C 1.0\n D3S6 0.5132\n D3A2 3.6\n D3S8 0.0\n D3A1 0.44\nend\n\n%mp2\nRI on\nDoSCS true\n PS 0.5922\n PT 0.0636\nend\n" 
proc=6
mem=2500


### OPTIONAL

#multi=1
#charge=0
prefix="SP_"
add_comment="revDSD single pont computation"
