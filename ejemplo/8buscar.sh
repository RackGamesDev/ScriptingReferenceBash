#!/bin/bash
#busca un texto dentro de un fichero pasado por parametros

arch=tmp0
correcto=s
palabra=tmp0
if [ $# -gt 0 ]
then
    for arch in $*
    do
        if [ ! -f $arch ]
        then
            correcto=n
            echo Hubo un problema con uno de los archivos, abortando
            break
        fi
    done
    if [ $correcto = s ]
    then
        echo ¿Qué palabra quieres buscar en los archivos?
        read palabra
        while [ -z $palabra ]
        do
            echo Introduce una palabra
            read palabra
        done
        touch resultado.txt
        echo Resultados de la palabra "$palabra" en los archivos: > resultado.txt
        echo $* >> resultado.txt
        echo ------ >> resultado.txt
        for arch in $*
        do
            echo En el fichero "$arch" la palabra "$palabra" se encuentra `grep -c $palabra $arch` veces >> resultado.txt
        done
        echo El fichero resultado.txt contiene todos los resultados de la búsqueda 
    fi
else
    echo Escribe archivo/s como parámetros
fi
