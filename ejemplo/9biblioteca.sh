#!/bin/bash
#gestiona una base de datos relacional de usuarios, libros y prestamos (los .txt)

touch usuarios.txt
touch libros.txt
touch prestamos.txt
op=0
nom=no
while [ $op != "x" ]
do
    echo -
    echo ---¿Qué quieres hacer?
    echo "1 = Listar usuarios"
    echo "2 = Insertar usuario"
    echo "3 = Listar libros"
    echo "4 = Insertar libro"
    echo "5 = Listar préstamos"
    echo "6 = Insertar préstamo"
    echo "Cualquier otro carácter para salir"
    read op
    case $op in
    1)
        echo Los usuarios son:
        linea=a
        while [ ! -z "$linea" ]
        do
            read linea
            nom=`echo $linea | cut -d ':' -f1`
            ap=`echo $linea | cut -d ':' -f2`
            dni=`echo $linea | cut -d ':' -f3`
            echo Nombre = $nom - Apellidos = $ap - DNI = $dni
        done < usuarios.txt;;
    2)
        echo Introduce el nombre del usuario
        read nom
        echo -n "$nom:" >> usuarios.txt
        echo Introduce el apellido del usuario
        read nom
        echo -n "$nom:" >> usuarios.txt
        echo Introduce el DNI del usuario
        read nom
        echo -n "$nom" >> usuarios.txt
        echo " " >> usuarios.txt;;
    3)
        echo Los libros son:
        linea=a
        while [ ! -z "$linea" ]
        do
            read linea
            nom=`echo $linea | cut -d ':' -f1`
            aut=`echo $linea | cut -d ':' -f2`
            cod=`echo $linea | cut -d ':' -f3`
            echo Nombre = $nom - Autor = $aut - Código = $cod
        done < libros.txt;;
    4)
        echo Introduce el nombre del libro
        read nom
        echo -n "$nom:" >> libros.txt
        echo Introduce el autor del libro
        read nom
        echo -n "$nom:" >> libros.txt
        echo Introduce el código del libro
        read nom
        echo -n "$nom" >> libros.txt
        echo " " >> libros.txt;;
    5)
        echo Los préstamos son:
        linea=a
        while [ ! -z "$linea" ]
        do
            read linea
            dni=`echo $linea | cut -d ':' -f1`
            cod=`echo $linea | cut -d ':' -f2`
            fecha=`echo $linea | cut -d ':' -f3`
            nombre=`grep $dni usuarios.txt | cut -d ':' -f1`
            libro=`grep $cod libros.txt | cut -d ':' -f1`
            echo DNI = $dni - Usuario = $nombre // Código = $cod - Libro = $libro // Fecha = $fecha
        done < prestamos.txt;;
    6)
        nom2=no
        temp=no
        estausr=n
        estalib=n
        fecha=x
        echo Introduce el DNI del usuario del préstamo
        read nom
        echo Introduce el código del libro del préstamo
        read nom2
        temp=`cat usuarios.txt | cut -d ':' -f3`
        for usuario in $temp
        do
            if [ $usuario = $nom ]
            then
                estausr=s
                break
            fi
        done
        temp=`cat libros.txt | cut -d ':' -f3`
        for libro in $temp
        do
            if [ $libro = $nom2 ]
            then
                estalib=s
                break
            fi
        done
        if [ $estausr = "s" -a $estalib = "s" ]
        then
            echo Introduce la fecha del préstamo
            read fecha
            echo "$nom:$nom2:$fecha" >> prestamos.txt
        else
            echo Error, el libro o el usuario no existen
        fi;;
    *)
        break;;
    esac
done
echo Saliendo