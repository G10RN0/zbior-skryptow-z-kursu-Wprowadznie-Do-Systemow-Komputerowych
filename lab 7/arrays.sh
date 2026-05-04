#!/bin/bash
declare -A matrix

#Z7.0
bubbleSort () {
    if [[ $(echo $* | grep -c "\.") -eq 0 ]]
    then
        tablica=($@)
        n=$#
        for (( i=0; $i < $n; i++ )) do
            for (( j=0; $j < $n-$i-1; j++ )) do
                if [[ ${tablica[$j]} -gt ${tablica[(($j + 1))]} ]] 
                then
                    temp=${tablica[$j]}
                    tablica[j]=${tablica[((j+1))]}
                    tablica[((j+1))]=$temp
                fi
            done
        done
        echo ${tablica[*]}
    else
        echo "tylko liczby calkowite"
        exit -1
    fi
}

bubbleSort 5 3 4 1 2 10 21 47 12.6 56

#7.1
multipliactionTab () {
    if [[ $# -eq 2 ]]
    then
        if [[ $(echo $* | grep -c ["\.-"]) -eq 0 ]]
        then
            for ((i = 1; i <= $1; i++ )) do
                for ((j = 1; j <= $2; j++ )) do
                    matrix[$i,$j]=$(($i*$j))
                done
            done
            for ((i = 0; i <= $1; i++ )) do
                for ((j = 0; j <= $2; j++ )) do
                    echo -n "${matrix[$i,$j]} "
                done
                echo ""
            done
        else
            echo "liczby musza byc calkowite i dodatnie"
            exit -1
        fi
    else
        echo "przyjmuje tylko dwa argumenty"
        exit -1
    fi
}
multipliactionTab 10 -10
echo ""

#7.2
integration (){
    if [[ $# -ge 3 ]]
    then
        if [[ $(echo $* | grep -c ["+i"]) -eq 0 ]]
        then
            tablica=($@)
            h=$(echo "(${tablica[1]}-${tablica[0]})" | bc -l)
            h=$(echo "$h/2" | bc -l)
            sum=${tablica[0]}
            for (( i=1; i < $#-1; i++ )) do
                sum=$(echo "$sum+${tablica[$i]}*2" | bc -l)
            done
            sum=$(echo "$sum+${tablica[-1]}" | bc -l)
            echo "$sum*$h" | bc -l
        else
            echo "liczby musza byc rzeczywiste"
            exit -1
        fi
    else
        echo "przyjmuje wiecej niz dwa argumenty"
        exit -1
    fi
}
integration 4 5 6 10+8i 8