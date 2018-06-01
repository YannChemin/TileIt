#!/bin/bash
cd ../testdata/
rm -Rf sub_*
n=2
for (( i=1 ; i <= 1 ; i++))
do
	n=$(echo $n"+"$n | bc)
	mkdir -p sub_$n\_$n
	bash ../sequential/tileimg.sh LC082150672017010301T1-SC20180219142350_stack_GCS.tif $n $n
done

