#!/bin/bash
#lista los usuarios del sistema

usuario=a
usuarios=0
touch .temp000
ls /home > .temp000
linea=”a”
echo --Usuarios en el sistema:
while [ ! -z "$linea" ]
do
    read linea
    usuarios=`expr $usuarios + 1`
    if [ ! -z "$linea" -o "$linea" = \n ]
    then
        echo "$linea"
    else 
        break
    fi
done < ./.temp000
echo --Numero de usuarios: `expr $usuarios - 1`
rm ./.temp000