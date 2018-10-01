#!/bin/bash

# SMD single point calculation

### NECESSARY 

#program=gaussian
# or 
#program=orca

program=gaussian
route="# pbe1pbe/def2SVP empiricaldispersion=gd3bj SCRF=(SMD,Solvent=Benzene) scf=tight int(grid=ultrafine) maxdisk=100gb  "
filetype="dat"
proc=6
mem=10000


### OPTIONAL

#multi=1
#charge=0
#prefix=""
add_comment="SMD single point calculation"
