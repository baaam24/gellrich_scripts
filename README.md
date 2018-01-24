# gellrich_scripts
Useful scripts for computations.

Use at own risk.

Feel free to check the **** out of them and report errors, criticism and suggestions to Tizian and/or Max

For getting the scripts to work on the different clusters please read INTRODUCTION.pdf 


Overview:

Use the flag -h to show the help file.

1) input: 
Create standard Input files for Gaussian16 or ORCA from .out or .xyz files
(can also be used for submitting)

2) submit: 
Submits all different conformere input files of Gaussian16 or ORCA in their respective folders to the respective programs. 
(the different conformeres have to be stored in folders with the names K followed by two digits)

3) out2xyz: 
Converts an output-file to a xyz file (calculation has to have a frequency calculation)
This script is automatically executed when the input-script uses an output file as an argument

4) conformere_org: 
When calculating different conformeres (names have to have K followed by two digits in their names)
this scripts creates folders for all conformeres and moves the input files into them

5) summary: 
Create a summary of computations in the command line and as a .csv file

Planned:

(working titles)

 3) better queue

 4) nice supporting info
