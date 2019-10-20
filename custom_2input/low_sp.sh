#!/bin/bash

# Final optimization at PBE0 def2-TZVP

### NECESSARY 

#program=gaussian
# or 
program=orca
route="! RIJK D3BJ B3LYP def2-QZVPP def2-QZVPP/C def2/JK TIGHTSCF Grid5 FINALGrid7"
filetype="inp"
block=" %method \n\t FrozenCore FC_ELECTRONS \n\t D3S6 0.5 \n\t D3A1 0.0 \n\t D3S8 0.2130  \n\t D3A2 6.0519 \n\t ScalHFX = 0.70 ScalDFX = 0.30 \n\t ScalGGAC = 0.56 \n\t ScalLDAC = 0.56 \n\t ScalMP2C = 1.0 \n end \n\n %mp2 \n\t RI on \n\t DoSCS true \n\t Ps 0.46 \n\t Pt 0.40 \n end "
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
prefix="SP_"
add_comment="DSD-BLYP-D3(BJ) single point for low level scheme"
