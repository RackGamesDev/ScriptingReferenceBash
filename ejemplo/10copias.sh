#!/bin/bash
#crea una copia de seguridad compresa/empaquetada en x sitio de x usuarios

usuarios=no
cont=0
directorio=no
modo=no
if [ $# -eq 0 ]
then
    echo Introduce la lista de usuarios a los que se les va a hacer la copia de seguridad, separado por espacios
    read usuarios
    for usuario in $usuarios
    do
        if [ -d /home/$usuario ]
        then
            cont=`expr $cont + 1`
        else
            echo El usuario $usuario no está dado de alta en el sistema
            exit 3
            break
        fi
    done
else
    for usuario in $*
    do
        if [ -d /home/$usuario ]
        then
            cont=`expr $cont + 1`
        else
            echo El usuario $usuario no está dado de alta en el sistema
            exit 3
            break
        fi
    done
    if [ $cont -eq $# ]
    then
        usuarios=$*
    fi
fi

echo Especifique el directorio donde se guardarán las copias de seguridad, la ruta completa
read directorio
if [ -d $directorio ]
then
    echo ¿Quieres empaquetar E o comprimir C?
    read modo
    while [ $modo != "E" -a $modo != "e" -a $modo != "c" -a $modo != "C" ]
    do
        echo ¿Quieres empaquetar E o comprimir C?
        read modo
    done
    echo Iniciando copia de seguridad
    if [ $modo = "E" -o $modo = "e" ]
    then
        for usuario in $usuarios
        do
            tar cvf $directorio/Copia.tar /home/$usuario # > /dev/null
        done   
    else
        for usuario in $usuarios
        do
            tar -cvzf $directorio/Copia.tar.gz /home/$usuario # > /dev/null
        done   
    fi
    echo Copia de seguridad completada en $directorio sobre los usuarios: $usuarios
else
    echo El directorio $directorio no existe o no hay permisos
    exit 3
fi
