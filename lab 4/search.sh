#!/bin/bash

#Z1
echo Z1
mkdir $2

cd $1

#Z2
echo Z2
find -type f -name *.txt 

#Z3
echo Z3
find -type d -name \[aAbB\]

#Z4
echo Z4
find -type f -executable -name *.sh 

#Z5
echo Z5
find -type f -empty -user student

#Z6
echo Z6
find -type f -links +1

#Z7
echo Z7
find -type f -group student -size 1M

#Z8
echo Z8
find -type f -perm -u+s
find -type f -perm -g+s

#Z9
echo Z9
find -type d -perm -+t

#Z10
echo Z10
find -type f -mmin -60

#Z11
echo Z11
find /dev -type b
find /dev -type c

#Z12
echo Z12
find -empty -exec rm -d {} \;

cd ..

#Z13
echo Z13
find $1 -type f -size +1M -exec cp {} $2 \;

#Z14
echo Z14
find $1 -name "Z*" -type d -exec cp -r {} $2 \;