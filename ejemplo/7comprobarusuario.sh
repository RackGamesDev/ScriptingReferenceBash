#!/bin/bash
#comprueba si los usuarios pasados por parametro existen y lista su home

if [ $# -gt 0 ]
then
    for usuario in $*
    do
        if [ -d /home/$1 ]
        then
            echo El usuario $usuario está dado de alta en el sistema, el contenido de su home es:
            ls /home/$usuario
            echo -----
        else
            echo El usuario $usuario no está dado de alta en el sistema
        fi
    done
else
    echo Debes introducir al menos un parámetro
fi