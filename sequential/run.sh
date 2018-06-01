#!/bin/bash
cd ../testdata/
rm -Rf sub_*
#if user input i.e. "bash run.sh 8 6"
#n1=$1
#n2=$2
#else direct input in the script:
n1=4
n2=4
for file in *.tif
do
	mkdir -p sub_$n1\_$n2
	bash ../sequential/tileimg.sh $file $n1 $n2
done

