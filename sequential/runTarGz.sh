#!/bin/bash
#if user input i.e. "bash run.sh 8 6"
#n1=$1
#n2=$2
#else direct input in the script:
n1=4
n2=4
#Go to data dir
cd ../testdata/
rm -Rf sub_*
#untar each tarball at a time
for file in *.tar.gz
do
	mkdir -p sub_$n1\_$n2
	tar -C sub_$n1\_$n2 -xvf $file
	cd sub_$n1\_$n2
	origTGZFiles=$(ls *.tif)
	for untarballedFile in *.tif
	do
		bash ../../sequential/tileimg.sh $untarballedFile $n1 $n2
	done
	#Cleanup $origTGZFiles
	for oTGZf in $origTGZFiles
	do 
		rm -f $oTGZf
	done
done
