#!/bin/bash
#una calculadora por parametros con operaciones simples

if [ $# -eq 3 ]
then
    case $2 in
    \+)
        echo `expr $1 + $3`;;
    \-)
        echo `expr $1 - $3`;;
    \*)
        echo `expr $1 \* $3`;;
    x)
        echo `expr $1 \* $3`;;
    \/)
        echo `expr $1 \/ $3`;;
    *)
        echo error, operacion no encontrada;;
    esac
else
    echo error, debes introducir 3 parametros: num1 operacion num2
fi

