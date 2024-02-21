#!/bin/bash
#lista el home del usuario pasado por parametros

usuario=a
if [ $# -gt 0 ]
then
    for usuario in $*
    do
        if [ -d /home/$usuario/ ]
        then
            echo ------------ Contenido del directorio de $usuario:
            ls /home/$usuario
        else
            echo El directorio /home/$usuario no existe
        fi
    done
else
    echo Tienes que introducir el nombre de un usuario dado de alta
fi
