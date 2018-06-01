#!/bin/bash
cd ../testdata/
rm -Rf sub_*
n=4
for file in *.tif
do
	mkdir -p sub_$n\_$n
	bash ../sequential/tileimg.sh $file $n $n
done

