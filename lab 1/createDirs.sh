#! /bin/bash
mkdir $1

mkdir $1/dir1
mkdir $1/dir1/dir1.1
touch $1/dir1/text1.txt

mkdir $1/dir2
mkdir $1/dir2/dir2.1
touch $1/dir2/dir2.1/file1.csv

mkdir $1/dir3
mkdir $1/dir3/dir3.1
mkdir $1/dir3/dir3.2
touch $1/dir3/dir3.2/file2.csv

mkdir $1/Aa
mkdir $1/Bb
mkdir $1/Cc

mv $1/dir1/text1.txt $1/dir1/dir1.1
mv $1/Aa $1/Aa1
cp $1/dir2/dir2.1/file1.csv $1/dir1
ls -d $1/*[12]
du -sh $1/*