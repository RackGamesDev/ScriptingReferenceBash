#!/bin/bash
#ordena las palabras pasadas por parametros

str1=$1
str2=$2
str3=$3
opcion=a
touch .temp000
if [ $# -eq 3 ]
then
    if [ -z $str1 -o -z $str2 -o -z $str3 ]
    then
        echo Una o más de las palabras estaba vacía
    else
        echo $str1 > .temp000
        echo $str2 >> .temp000
        echo $str3 >> .temp000
        echo ¿Como quieres ordenar las palabras?
        echo O=Ordenadas alfábeticamente // I=Inversamente
        read opcion
        while [ $opcion != "o" -a $opcion != '[O]' -a $opcion != "i" -a $opcion != "I" ]
        do
            echo Opción incorrecta
            read opcion
        done
        echo --El orden es:
        if [ $opcion = "o" -o $opcion = "O" ]
        then
            sort .temp000
        else
            sort -r .temp000
        fi
    fi
else
    echo Introduce 3 palabras como parámetros
fi
rm .temp000