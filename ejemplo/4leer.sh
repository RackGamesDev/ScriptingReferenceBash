#! /bin/bash
#comando similar al cat, recibe una ruta por parametros

linea=”a”
num=0
if [ -s $1 ]
then
    while [ ! -z "$linea" ]
    do
        read linea
        num=`expr $num + 1`
        if [ ! -z "$linea" -o "$linea" = \n ]
        then
            echo "$linea"
        else 
            break
        fi
    done < $1
    echo Numero de lineas: $num
else
    echo Fichero vacio o inexistente
fi

