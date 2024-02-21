#!/bin/bash
#script que cambia los permisos de un fichero

fich=no
op=no
permusr=0
permgrp=0
permotr=0
echo Escribe la ruta de un fichero
read fich
if [ -f $fich -o -d $fich ]
then


echo ¿Quieres cambiar los permisos C o verlos V?
read op
while [ $op != "c" -a $op != "v" -a $op != "C" -a $op != "V" ]
do
    echo Escribe C o V
    read op
done

if [ $op = "c" -o $op = "C" ]
then
    echo PROPIETARIO: ¿Permisos de lectura? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permusr=`expr $permusr + 4`
    fi
    echo PROPIETARIO: ¿Permisos de escritura? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permusr=`expr $permusr + 2`
    fi
    echo PROPIETARIO: ¿Permisos de ejecución? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permusr=`expr $permusr + 1`
    fi

    echo GRUPO: ¿Permisos de lectura? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permgrp=`expr $permgrp + 4`
    fi
    echo GRUPO: ¿Permisos de escritura? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permgrp=`expr $permgrp + 2`
    fi
    echo GRUPO: ¿Permisos de ejecución? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permgrp=`expr $permgrp + 1`
    fi

    echo OTROS: ¿Permisos de lectura? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permotr=`expr $permotr + 4`
    fi
    echo OTROS: ¿Permisos de escritura? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permotr=`expr $permotr + 2`
    fi
    echo OTROS: ¿Permisos de ejecución? S/N
    read op
    while [ $op != "s" -a $op != "n" -a $op != "S" -a $op != "N" ]
    do
        echo Escribe S o N
        read op
    done
    if [ $op = "s" -o $op = "S" ]
    then
        permotr=`expr $permotr + 1`
    fi

    chmod $permusr$permgrp$permotr $fich
    echo El código de permisos de $fich ahora es $permusr$permgrp$permotr
else
    perms=`ls -l $fich | cut -d ' ' -f1`
    ev=`expr substr "$perms" 2 1`
    if [ $ev = "r" ]
    then
        echo El propietario tiene permisos de lectura
    else
        echo El propietario no tiene permisos de lectura
    fi
    ev=`expr substr "$perms" 3 1`
    if [ $ev = "w" ]
    then
        echo El propietario tiene permisos de escritura
    else
        echo El propietario no tiene permisos de escritura
    fi
    ev=`expr substr "$perms" 4 1`
    if [ $ev = "x" ]
    then
        echo El propietario tiene permisos de ejecucion
    else
        echo El propietario no tiene permisos de ejecucion
    fi
    
    ev=`expr substr "$perms" 5 1`
    if [ $ev = "r" ]
    then
        echo El grupo tiene permisos de lectura
    else
        echo El grupo no tiene permisos de lectura
    fi
    ev=`expr substr "$perms" 6 1`
    if [ $ev = "w" ]
    then
        echo El grupo tiene permisos de escritura
    else
        echo El grupo no tiene permisos de escritura
    fi
    ev=`expr substr "$perms" 7 1`
    if [ $ev = "x" ]
    then
        echo El grupo tiene permisos de ejecucion
    else
        echo El grupo no tiene permisos de ejecucion
    fi
    
    ev=`expr substr "$perms" 8 1`
    if [ $ev = "r" ]
    then
        echo El resto tiene permisos de lectura
    else
        echo El resto no tiene permisos de lectura
    fi
    ev=`expr substr "$perms" 9 1`
    if [ $ev = "w" ]
    then
        echo El resto tiene permisos de escritura
    else
        echo El resto no tiene permisos de escritura
    fi
    ev=`expr substr "$perms" 10 1`
    if [ $ev = "x" ]
    then
        echo El resto tiene permisos de ejecucion
    else
        echo El resto no tiene permisos de ejecucion
    fi
    
fi
else
    echo $fich no encontrado, abortando
fi
