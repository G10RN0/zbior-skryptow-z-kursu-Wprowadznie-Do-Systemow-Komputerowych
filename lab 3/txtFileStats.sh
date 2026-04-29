#!/bin/bash

#Z1
file $1 | cut -f 4 -d ' '

#Z2
wc -l $1

#Z3
wc -m $1

#Z4
du -h $1
#Z5
cat $1 | grep $2 | wc -l

#Z6
cat $1 | grep -v $2 | wc -l

#Z7
cat $1 | head -n 5 | tail -n 1