#!/bin/bash

#Z6
calculateBMI () {
	if [[ $# -ne 2 ]] 
	then
		echo "podano $# argumenty, a nie 2 argumenty"
		exit -1
	else
		echo "scale=2; $1/($2*$2)" | bc -l
	fi
}

#6.1
factorialRec () {
	if [[ $# -ne 1 ]] 
	then
		echo "podano $# argumentów, a nie 1 argument"
		exit -1
	elif [[ $1 -eq 1 ]]
	then
		echo "1"
	else
		before=$(echo "$1-1" | bc)
		echo "$1*$(factorialRec $before)" | bc
	fi
}

#Z6.2
factorialIter () {
	if [[ $# -ne 1 ]] 
	then
		echo "podano $# argumentów, a nie 1 argument"
		exit -1
	else
		num=1
		i=0
		while [[ $i -lt $1 ]]
		do
			num=$(echo "$num*($1-$i)" | bc)
			i=$(echo "$i+1" | bc)
		done
		echo $num
	fi
}

#Z6.3
sumArgs () {
	sum=0
	for number in $@
	do
		if [[ $(echo $number | grep -c "\.") -eq 0 ]]
		then
			sum=$(echo "$sum+$number" | bc)
		else
			echo "dodaje tylko liczby całkowite"
			exit -1
		fi
	done
	echo $sum
}

calculateBMI 60 1.8
factorialRec 6
factorialIter 6
sumArgs 1 2 3 4