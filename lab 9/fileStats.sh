#9.0
stats(){

    #plik zrodlowy
    if [[ ! -f $1 && ! -r $1 ]];
    then
        echo "plik $1 nie istnieje lub nie mam prawa do odczytu"
        exit -1
    fi

    #plik docelowy
    if [[ -f $2 ]];
    then
        if [[ ! -w $2 ]];
        then
            echo "nie mam prawa do edytowania pliku $2"
            exit -1
        fi
    else
        if ! touch $2;
        then
            echo "nie moge utorzyc pliku $2"
            exit -1
        fi
    fi

    declare -A zliczenie

    slowa=$(cat $1 | tr [[:blank:]] "\n")
    for slowo in $slowa
    do
        zliczenie[$slowo]=$(echo "${zliczenie[$slowo]:-0} + 1" | bc)
    done

    echo > $2
    for klucz in "${!zliczenie[@]}"; do
        echo "$klucz:${zliczenie[$klucz]}" >> $2
    done

    echo $(sort -t: -k2,2nr $2) > temp.txt
    sed 's/ /\n/g' temp.txt > $2
    rm temp.txt
}

stats tekst.txt statystyka.txt