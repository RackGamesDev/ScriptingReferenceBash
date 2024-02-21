#!/bin/bash
#contar los numeros de 0 a x, poniendo los pares y impares

cont=0
limite=0
echo introduce limite
read limite
echo TODOS:
while [ $cont -lt $limite ]
do
 echo $cont
 cont=`expr $cont + 1`
done
cont=0
echo PARES:
while [ $cont -lt `expr $limite + 1` ]
do
 echo $cont
 cont=`expr $cont + 2`
done
cont=1
echo IMPARES:
while [ $cont -lt `expr $limite + 1` ]
do
 echo $cont
 cont=`expr $cont + 2`
done
