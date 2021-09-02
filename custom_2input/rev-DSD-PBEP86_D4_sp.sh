#!/bin/bash


### NECESSARY 

#program=gaussian
# or 
program=orca
route="!  RKS def2-QZVPP def2-QZVPP/c def2/JK TIGHTSCF RIJK GRID6 FINALGrid7 NoPOP d4"
filetype="inp"
block="%method /nFrozenCore FC_ELECTRONS /n/t Exchange X_PBE /n/t Correlation C_P86 /n/t ScalHFX 0.69 /n/t ScalDFX 0.31 /n/t ScalGGAC 0.4210 /n/t ScalLDAC 0.4210 /n/t ScalMP2C 1.0 /n/t D3S6 0.5132 /n/t D3A2 3.6 /n/t D3S8 0.0 /n/t D3A1 0.44 /nend /n /n%mp2 /n/t RI on /n/t DoSCS true /n/t PS 0.5922 /n/t PT 0.0636 /nend /n /n"
proc=6
mem=2000


### OPTIONAL

#multi=1
#charge=0
prefix="SP_"
add_comment="revDSD-PBEP86-D4 single point"
