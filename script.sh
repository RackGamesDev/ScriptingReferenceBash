#!/bin/bash
#comentarios con el hashtag, primera linea obligatoria
#se ejecuta con sh "nombre de archivo"

#se pueden ejecutar comandos como de normal, el salto de linea indica un cambio de comando
echo "aaaaa"
#; para varios comandos en una linea
echo "1"; echo "2"
#para salir del script se usa "exit 3"


#declarar variable
var1=2
var2=4
var3=asdfas

#el $ devuelve el contenido de la variable directamente (o busca en el fichero env)
echo $var3
#nombre script, numero de argumentos, todos los argumentos, salida del ultimo proceso, id del proceso, todos los argumentos como lista, usuario, maquina, segundos abierto, numero aleatorio, numero de lineas
echo $0 $# $@ $? $$ $* $USER $HOSTNAME $SECONDS $RANDOM $LINENO

#como echo pero admite operaciones (hay que usar espacios)
expr 1 + 2
expr $var1 - $var2
#para multiplicar o dividir hay que escapar el caracter con \
expr 2 \* 2
expr 2 \/ 2

#con echo, el ` obliga la ejecucion de su interior (simbolo de tilde reversa)
echo `expr $var1 + 5`
#tambien se puede con $()
echo $(expr 1 + 1)
echo $((1+1))
#similar a las pipes, los > y >> tambien funcionarian
echo | expr 4 + 4


#para recibir texto por consola, volcandolo a una variable (el script se pausa)
entrada=a
read entrada
echo $entrada
#con ' se pone talcual pero con " si se interpretan las variables
echo '$entrada'

#hace referencia a los parametros en orden introducidos al ejecutar el script
echo $1 $2 $3
#hace referencia al numero de parametros introducidos
echo $#
#es una lista con todos los parametros incluyendo el 0(nombre del script)
echo $*


#condicional if,  -eq:=  -gt:>  -lt:<  -ne:!=  -ge:>=  -le <=  (en las condiciones los numeros van con '')
if [ $var1 -eq $var2 ]
then
    echo "verdadero"
elif [ $var1 -eq '10' ]
then
    echo "otro"
else
    echo "falso"
fi
#! pone la condicin al reves
if [ $var1 !-eq $var2]
then
    echo no es
fi
#comprobar varias condiciones, -o: or   -a: and
if [ $var1 -gt 2 -o $var1 -eq 10 ]
then
    echo "verdadero"
fi
#comprobacion de archivos: -f ruta (fichero normal)   -d ruta (directorio)   -l (enlace)   -x ruta (ejecutable)   -s ruta (pesa mas que 0)
#comprobacion de strings: "$var" = "asdf" (si son iguales)   -z string (vacia)   "$var" != "asdf" (si no son iguales)    


#condicional case para evaluar una variable (funciona igual con numeros y texto) (;; al final para cambiar)
case $var1 in
0)
    echo "cero";;
1)
    echo "uno";;
2)
    echo "dos";;
dos)
    echo "dos con texto";;
*)
    echo "otra cosa"
esac


#bucle while basico (tambien se puede usar until)
while [ $var1 -lt '10' ]
do
    echo -n $var1
    var1=`expr $var1 + 1`
    #saltar esa iteracion para ir a la siguiente ignorando el proximo codigo
    continue
    #sale del bucle ignorando el proximo codigo
    break
done

#cuando done recible un archivo con < la primera variable de read recibira el contenido de la linea i
linea=”a”
while [ ! -z "$linea" ]
do
    #recibe lo del < del done
    read linea
    #comprueba si la linea no es null / no es el eof
    if [ ! -z "$linea" ]
    then
        echo "$linea"
    else
        break
    fi
done < ./script.sh

#igual que el while pero suma solo usando una variable como contador (en este caso itera "1 2 3 4 5" pero tambien valdria texto (sin comillas))
for var1 in 1 2 3 4 5
do
    echo $var1
done
#usando las wildcards hace referencia a los archivos de ese directorio (* para todos los archivos)
for var1 in *
do
    echo $var1
done
#si se usa como entrada un texto lo separara usando el espacio
texto="aa bb cc dd"
for var1 in $texto
do
    echo $var1
done


variablesc=ioio
#declarar una funcion para ejecutar su codigo mas adelante
funcion(){
    #las variables siguen siendo globales
    variablesc=asdf
    #a no ser que se use local, entonces solo sirve aqui dentro
    local variablesc=332342
    echo $variablesc
    #los argumentos son segun los datos que se usen al llamarla
    echo $1
    #si hay mas de 9 argumentos se especifican asi
    #echo $(10)
}
#ejecutar la funcion (se pueden poner mas datos como argumentos)
funcion asdfasdfasdf

funcion2(){
    echo sumar
    #esta funcion devuelve un dato
    return `expr $1 + $2`
}
#para usar el dato que devuelve una funcion, se llama y se recoge con $?
funcion2 3 7
echo $?

#con source se pueden recoger variables y funciones de otros scripts
#source ./script2.sh
#funcionexterna

