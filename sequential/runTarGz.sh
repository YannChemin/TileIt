#!/bin/bash
#if user input i.e. "bash run.sh 8 6"
#n1=$1
#n2=$2
#else direct input in the script:
n1=4
n2=4
root=$(pwd)
#Go to data dir
cd $root/../testdata/
rm -Rf sub_*
#untar each tarball at a time
for file in *.tar.gz
do
	mkdir -p $root/../testdata/sub_$n1\_$n2
	listF=$(tar -tzf lotsofdata.tar.gz | grep .tif)
	for listedFile in listF
	do
		cd $root/../testdata/
		tar -C $root/../testdata/sub_$n1\_$n2 -xvf $file --wildcards --no-anchored $listedFile
		cd $root/../testdata/sub_$n1\_$n2
		bash $root/tileimg.sh $listedFile $n1 $n2 
	done
	rm -f $root/../testdata/sub_$n1\_$n2/*.tif
	mv $root/../testdata/sub_$n1\_$n2/sub_$n1\_$n2/*.tif $root/../testdata/sub_$n1\_$n2/
	rm -Rf $root/../testdata/sub_$n1\_$n2/sub_$n1\_$n2
	cd $root/../testdata/
done
