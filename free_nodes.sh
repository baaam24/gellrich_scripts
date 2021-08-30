#!/bin/bash

### Fixed Variables:





### starup routine

host=`ident_host | awk '{print $1}' `



case "$host" in
	unkown)
	echo "unknown cluster"
	exit 1
	;;
	JustHPC)
	partitions="short regular"
	;;
	HALO)
	echo "Usage of cores on halo"
	echo -e "alloc\tidle\tother\ttotal "
# 	      24      12      0       36

	sinfo -p UG -h -o  "%C" | sed -e 's@/@\t@g'	
		
	exit 0
	;;
	FUCHS)
	partitions="fuchs"
	;;
	GOETHE)
	partitions="general1 general2"
	;;
	*)
	echo "identifaction of cluster failed"
	exit 3
	;;
esac


### main script execution

sinfo -N >> freeslots.tmp

for partition in $partitions; do
	echo -n "free slots on $partition: "    # -n: no newline
	grep -c   "$partition idle" freeslots.tmp
done

### cleanup

 rm freeslots.tmp

