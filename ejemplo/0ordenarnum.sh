#!/bin/bash
#ordena 3 numeros

vara=0
varb=0
varc=0
echo "Ordenar de menor a mayor"

echo "Numero A"
read vara
echo "Numero B"
read varb
echo "Numero C"
read varc

if [ $vara -gt $varb ]
then
    if [ $vara -gt $varc ]
    then
        if [ $varb -gt $varc ]
        then
            echo cba $varc $varb $vara
        else
            echo bca $varb $varc $vara
        fi
    else
        if [ $varb -gt $varc ]
        then
            echo cab $varc $vara $varb
        else
            echo bac $varb $vara $varc
        fi
    fi
else
    if [ $varb -gt $varc ]
    then
        echo acb $vara $varc $varb
    else
        echo abc $vara $varb $varc
    fi
fi
