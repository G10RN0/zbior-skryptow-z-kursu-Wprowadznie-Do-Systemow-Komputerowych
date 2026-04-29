#!/bin/bash

#Z1
mkdir $1

#Z2
cat /etc/passwd | grep $(whoami)

#Z3
cat /etc/passwd | cut -d ':' -f1,6,7 | sort -r > $1/F1.csv

#Z4
cat /etc/passwd | cut -d ':' -f 7 | rev | sort | rev | uniq > $1/F2.csv

#Z5
cat /etc/passwd | cut -d ':' -f 1 | tr [:lower:] [:upper:] > $1/F3.txt

#Z6
cat /etc/passwd | grep -n4 $(whoami) > $1/F4.txt

#Z7
diff -y /etc/passwd $1/F4.txt > $1/differences.txt