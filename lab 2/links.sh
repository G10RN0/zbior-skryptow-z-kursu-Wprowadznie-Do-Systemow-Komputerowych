#!/bin/bash

#Z1
mkdir $1

#Z2
mkdir $1/D1
mkdir $1/D2
touch $1/D2/F1.txt
mkdir $1/D3
touch $1/D3/F1.txt
mkdir $1/D4
touch $1/D3/F1.txt

#Z3
ln -s /etc/passwd $1/D1/

#Z4
readlink $1/D1/passwd

#Z5
ln $1/D3/F1.txt $1/D2/F2.txt

#Z6
chmod 600 $1/D2/F2.txt

#Z7
chown student $1/D2/F2.txt

#Z8
chgrp student $1/D3/

#Z9
chmod u-x,g-x,o-x $1/D3/
cd $1/D3/

#Z10
chmod u-w,g-w,o-w $1/D2/
touch $1/D2/X.txt

#Z11
chmod u-r,g-r,o-r $1/D4/
ls $1/D4/

#Z12
chmod +t $1/D4/

#Z13
touch $1/D1/scr1.sh
chmod u+x,g+x,o-x $1/D1/scr1.sh

#Z14
chmod u+s,g+s $1/D1/scr1.sh