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


function line_0 {
echo "-----------------------------------------------"
     #  NEW  | 6    | 0    | 6    | 2018-02-14_13:30
}
function line_1 {
echo "-------+------+------+------+------------------"
     #  NEW  | 6    | 0    | 6    | 2018-02-14_13:30
}
function head_1 {
echo "       | R    | PD   | ALL  |                  "
     #  NEW  | 6    | 0    | 6    | 2018-02-14_13:30
}




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
 qstat -xml | tr '\n' ' ' | sed 's#<job_list[^>]*>#\n#g'   | sed 's#<[^>]*>##g' | grep " " | column -t awk '{print $5 " " $1 " " $3 }' >> $N_P
}



case $HOST in
	SKYLLA )
	shift_files; squeue_2
	;;
	HALO )
	shift_files; squeue_1
	;;
	LOEWE )
	shift_files; squeue_1
	;;
	FUCHS )
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

NEW_PND_JOBS=` grep -c " *[PD][ ][0-9][0-9][0-9]* " $N_P `
OLD_PND_JOBS=` grep -c " *[PD][ ][0-9][0-9][0-9]* " $O_P `

OLD_NOW=`head -1 $O_P`



printf '  %-4s | %-4s | %-4s | %-4s | %-15s \n' NEW $NEW_RUN_JOBS $NEW_PND_JOBS $NEW_ALL_JOBS $NOW
printf '  %-4s | %-4s | %-4s | %-4s | %-15s \n' OLD $OLD_RUN_JOBS $OLD_PND_JOBS $OLD_ALL_JOBS $OLD_NOW

line_1

sed  "1d" $O_P > $HOME/.tmp_qs/jobs_old.txt
sed  "1d" $N_P > $HOME/.tmp_qs/jobs_new.txt


diff $HOME/.tmp_qs/jobs_old.txt $HOME/.tmp_qs/jobs_new.txt  > $HOME/.tmp_qs/diff.txt




#DIFF_NEW=`grep ">" $HOME/.tmp_qs/diff.txt`
#DIFF_OLD=`grep "<" $HOME/.tmp_qs/diff.txt`

echo "new entries in queue:"
grep ">" $HOME/.tmp_qs/diff.txt

line_1

echo "entrys no longer in queue: "
grep "<" $HOME/.tmp_qs/diff.txt













