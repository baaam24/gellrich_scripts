#!/bin/bash

# NMR single point calculation TZ-basis

### NECESSARY 

#program=gaussian
# or 
#program=orca

program=gaussian
route=" # pbe1pbe/def2TZVP NMR scf=tight int(grid=ultrafine) maxdisk=100gb empiricaldispersion=gd3bj"
filetype="dat"
proc=6
mem=10000mb


### OPTIONAL

#multi=1
#charge=0
#prefix="SMD_"
suffix="_NMR"
add_comment="NMR single point calculation"
