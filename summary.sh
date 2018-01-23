#!/bin/bash
#
# create summarys of your computations 
#
# version history:
#
# version 0.1: (19.01.2018) 
# Tizian Müller: 
# - basic stuff with gaussian .out-Files
# script is not fully tested. Use at your own risk
# please report any bugs and suggestions via mail or during cigarette breaks
#

# difine variables
VERSION="0.1"
USERNAME=`whoami`
DIR=`pwd`
CSVFILENAME="summary.csv"
CSVFILENAME_BKUP="summary_bkup.csv"
CSVDELIM=";"
DECISEP="."
SCRIPTDIR=`dirname $(readlink -f ${0})`
MAXFILES=25 # maximal files summary will read without extra user input

function prnt_error {
echo -e "\033[0;31m ERROR ! stopping script \033[0m "
}

function prnt_warning {
echo -e "\033[1;33m WARNING ! \033[0m "
}

function prnt_ok {
echo -e -n "\033[0;32m OK: \033[0m "
}


## here schould be some sort of check for arguments

while getopts ":hd:s:" OPTION; do
  case $OPTION in
    h) 
	vim $SCRIPTDIR/help_summary.txt  
	exit
	;;
	d)
	CSVDELIM=$OPTARG
	;;
	s)
	DECISEP=$OPTARG
	;;
    \?)
    echo "Invaliddsfasdfsdaf option: -$OPTARG" >&2
	echo "For Help type: sumary -h"
	exit
    ;;
  esac
done



# show welcome message
echo "summary version $VERSION  "

LIST=`find -name "*.out"`
LISTARR=($LIST)


# asks for user reply if too much files are found

if [ ${#LISTARR[@]} -gt $MAXFILES ]
then echo "found a large amount of .out files"
     echo "${#LISTARR[@]} / $MAXFILES"
     read -p "Do you want to proceed ? " -n 1 -r 
		case $REPLY in
        [Yy]* ) echo "  OK";;
        [Nn]* ) echo ""; exit;;
        * ) echo "  Please answer Y or N."; exit ;;
        esac
else echo "found ${#LISTARR[@]} .out files .. starting now"
fi

echo "found ${#LISTARR[@]} .out files"



######################################################
#            Functions for reading various stuff

function find_methode { # gives the used Method
RAW=`grep -m 1 "GINC-" $name | sed -e 's.\\\. .g'`
METH=` echo $RAW | awk '{print $5}'`
BASIS=`echo $RAW | awk '{print $6}'`
}

function find_energ { 
ENERG_EL=`tac $name | grep -m 1 "SCF Done:  " | awk '{print $5}'`
}

function find_ther_corr { # finds the themal corrections for electronic Energy
 ZPVE=`grep "Zero-point correction=" $name | awk '{print $3}'`
 RAW=`grep -A 8 "Zero-point correction=" $name| awk 'NF>1{print $NF}'`
 RAWARRAY=($RAW)
 
 ENERG_THERM=${RAWARRAY[1]}
 ENTHALPY=${RAWARRAY[2]}
 GIBBS=${RAWARRAY[3]}

#ZPVE=`grep "Zero-point correction=" $name | awk '{print $3}'`
#ENERG=`grep "Thermal correction to Energy=" $name | awk '{print $5}'`
#ENTHALPY=`grep "Thermal correction to Enthalpy= " $name | awk '{print $5}'`
#GIBBS=`grep "Thermal correction to Gibbs Free Energy= " $name | awk '{print $7}'`
}

function find_Nimag {
if  [ -z `grep -i -m 1 "imaginary frequencies (negative Signs" $name | awk '{print $2}'` ]
then IMAG="0"
else IMAG="`grep -i -m 1 "imaginary frequencies (negative Signs" $name | awk '{print $2}'`"
fi
}

function find_NTerm {
 NTHERM=`grep -c "Normal termination of Gaussian" $name`
}

function find_version {
RAW=`grep -m 1 -A 2 "Cite this work as:" $name`
PROG=`echo $RAW | awk '{print $5 $6}' | sed 's/,//g'`
REV=`echo $RAW | awk '{print $8}' | sed 's/,//g'`
}


######################################################
# initialisation of the *.csv files

echo "summary.sh" > $CSVFILENAME #
echo "user;$USERNAME" >> $CSVFILENAME
echo "directory;$DIR" >> $CSVFILENAME
echo "host;$(hostname)" >> $CSVFILENAME

echo " " >> $CSVFILENAME

TABLEHEAD="File name;method; basisset; E(el); ZP corr.; E corr.; H corr.; G corr.; imaginary frequencies; Normal terminations; programm; Revison "

echo "$TABLEHEAD" >> $CSVFILENAME

######################################################
# actuale magic happens here
echo "name METH BASIS ENERG ZPVE ENERG ENTHALPY GIBBS"

for name in "${LISTARR[@]}" ; do

find_methode
find_energ
find_ther_corr
find_Nimag
find_NTerm
find_version
name=`echo $name | sed -e 's/\.//g' `


echo "$name $METH $BASIS $ENERG_EL $ZPVE $ENERG_THERM $ENTHALPY $GIBBS $IMAG $NTHERM $PROG $REV"
echo "$name;$METH;$BASIS;$ENERG_EL;$ZPVE;$ENERG_THERM;$ENTHALPY;$GIBBS;$IMAG;$NTHERM;$PROG;$REV" >> $CSVFILENAME

done

######################################################
#post processing of the csv file
#change the CSV delimiter


if [ "$CSVDELIM" != ";" ]
then
	cp $CSVFILENAME $CSVFILENAME_BKUP
	awk '$1=$1' FS=";" OFS="$CSVDELIM" $CSVFILENAME_BKUP > $CSVFILENAME
fi

#change the decimal seperator

if [ "DECISEP" != "." ]
then
	cp $CSVFILENAME $CSVFILENAME_BKUP
	sed "s/\./$DECISEP/g" $CSVFILENAME_BKUP > $CSVFILENAME
	#awk '$1=$1' FS=";" OFS="$CSVDELIM" $CSVFILENAME_BKUP > $CSVFILENAME
fi







