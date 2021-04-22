#!/bin/bash
#
# easy overview of jobqueue 
#
# 

HOST=`ident_host | awk '{print $1}'`
NOW=`date '+%Y-%m-%d_%H:%M'`
N_P=$HOME/.tmp_qs/new.txt
O_P=$HOME/.tmp_qs/old.txt
USER=`echo $USER`
SCRIPTDIR=`dirname $(readlink -f ${0})`
LIST=0


function line_0 {
echo "-----------------------------------------------"
     #  NEW  | 6    | 0    | 6    | 2018-02-14_13:30
}
function line_1 {
echo "-------+------+------+------+------------------"
     #  NEW  | 6    | 0    | 6    | 2018-02-14_13:30
}
function line_2 {
echo "==============================================="
     #  NEW  | 6    | 0    | 6    | 2018-02-14_13:30
}
function head_1 {
echo "       | R    | PD   | ALL  |                  "
     #  NEW  | 6    | 0    | 6    | 2018-02-14_13:30
}



while getopts "hl" OPTION; do
  case $OPTION in
    h) 
	vim $SCRIPTDIR/help_qs.txt  
	exit
	;;
	l)
	LIST=1
	;;
	\?)
    echo "Invalid option: -$OPTARG" >&2
	echo "For Help type: qs -h"
	exit
    ;;
  esac
done




if [ -e "$HOME/.tmp_qs" ]
	then
	echo "QS: Queue Short"
	head_1
	line_1
	else 
	echo "QS not initialised"
	mkdir $HOME/.tmp_qs
	echo file initialised > $N_P
	echo file initialised > $O_P
fi


function shift_files {
cp $N_P $O_P
echo $NOW > $N_P
}

function squeue_1 {
squeue -u $USER -o "%.18i %.9P %.20j %.8u %.2t %.10M %.6D %R" | awk '{print $5 " " $1 " " $3 }' >> $N_P
}

function squeue_2 {
 qstat -xml | tr '\n' ' ' | sed 's#<job_list[^>]*>#\n#g'   | sed 's#<[^>]*>##g' | grep " " | column -t |  awk '{print $5 " " $1 " " $3 }' >> $N_P
}



case $HOST in
	SKYLLA )
	shift_files; squeue_2
	;;
	HALO )
	shift_files; squeue_1
	;;
	GOETHE )
	shift_files; squeue_1
	;;
	FUCHS )
	shift_files; squeue_1
	;;
	JustHPC )
	shift_files; squeue_1
	;;
	*)
	echo unknown host
	exit
	;;
esac


NEW_ALL_JOBS=` grep -c " *[0-9][0-9][0-9][0-9][0-9]* " $N_P `
OLD_ALL_JOBS=` grep -c " *[0-9][0-9][0-9][0-9][0-9]* " $O_P `

NEW_RUN_JOBS=` grep -c " *[rR][ ][0-9][0-9][0-9]* " $N_P `
OLD_RUN_JOBS=` grep -c " *[rR][ ][0-9][0-9][0-9]* " $O_P `

#NEW_PND_JOBS=` grep -c " *[PD][ ][0-9][0-9][0-9]* " $N_P `
#OLD_PND_JOBS=` grep -c " *[PD][ ][0-9][0-9][0-9]* " $O_P `

NEW_PND_JOBS=` grep -c " *[PD][ ][0-9][0-9][0-9]*\|qw" $N_P `
OLD_PND_JOBS=` grep -c " *[PD][ ][0-9][0-9][0-9]*\|qw" $O_P `

OLD_NOW=`head -1 $O_P`



printf '  %-4s | %-4s | %-4s | %-4s | %-15s \n' NEW $NEW_RUN_JOBS $NEW_PND_JOBS $NEW_ALL_JOBS $NOW
printf '  %-4s | %-4s | %-4s | %-4s | %-15s \n' OLD $OLD_RUN_JOBS $OLD_PND_JOBS $OLD_ALL_JOBS $OLD_NOW

line_2

sed  "1d" $O_P > $HOME/.tmp_qs/jobs_old.txt
sed  "1d" $N_P > $HOME/.tmp_qs/jobs_new.txt


diff $HOME/.tmp_qs/jobs_old.txt $HOME/.tmp_qs/jobs_new.txt  > $HOME/.tmp_qs/diff.txt




#DIFF_NEW=`grep ">" $HOME/.tmp_qs/diff.txt`
#DIFF_OLD=`grep "<" $HOME/.tmp_qs/diff.txt`

echo "new entries in queue:"
grep ">" $HOME/.tmp_qs/diff.txt

line_0

echo "entries no longer in queue: "
grep "<" $HOME/.tmp_qs/diff.txt


if [ "$LIST" = 1 ]
	then
	line_0
	echo "current jobs in queue: "
	cat $N_P | sed -e 1d
	fi










