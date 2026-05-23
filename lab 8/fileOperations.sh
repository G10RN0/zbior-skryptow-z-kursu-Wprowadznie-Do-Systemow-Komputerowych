#!/bin/bash

#Z 8.0
rozdziel () {
    if [[ ! -r $1 ]];
    then
        echo "nie mam prawa do odczytu pliku zrodlowego" >&2
        exit -1
    fi

    if [[ ! -f $2 || ! -f $3 ]];
    then
        touch $2
        touch $3
    else
        if [[ ! -w $2 || ! -w $3 ]];
        then
            echo "nie mam prawa do edycji plikow wyjsciowych" >&2
            exit -1
        else
            echo > $2
            echo > $3
        fi
    fi

    while read -r line ; do
        if [[ $RANDOM%2 -eq 0 ]];
        then
            echo $line >> $2
        else
            echo $line >> $3
        fi
    done < $1
}
rozdziel "katalog/mniejszy/Lab8_plik.txt" "out1.txt" "out2.txt"

#Z 8.1
struktura () {
    if [[ ! -d $1 ]];
    then
        echo "argument pierwszy nie jest katalogiem" >&2
        exit -1
    fi
    if [[ ! -w $1 ]];
    then
        echo "nie moge tworzyc nowych rzeczy w katalogu $1" >&2
        exit -1
    fi
    path=$1/$2
    if [[ ! -r $path ]];
    then
        echo "nie mam uprawnien do pliku $2 w katalogu" >&2
        exit -1
    fi

    while read -r line ; do
        if [[ $(echo $line | grep -c "\." ) -eq 0 ]];
        then
            mkdir -p "$1/$line"
        else
            mkdir -p "$(dirname "$1/$line")"
            touch "$1/$line"
        fi
    done < $path
}

struktura "katalog/mniejszy" "Lab8_plik.txt"