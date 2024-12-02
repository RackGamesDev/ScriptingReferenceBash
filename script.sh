#!/bin/bash
#Comentarios con el hashtag, primera linea obligatoria
#Se ejecuta con sh "nombre de archivo"

#Se pueden ejecutar comandos como de normal, el salto de linea indica un cambio de comando
echo "aaaaa"
#; Para varios comandos en una linea
echo "1"; echo "2"
#Para salir del script se usa "exit 3"


#Declarar variable
var1=2
var2=4
var3=asdfas

#El $ devuelve el contenido de la variable directamente (o busca en el fichero env)
echo $var3
#Nombre script, numero de argumentos, todos los argumentos, salida del ultimo proceso, id del proceso, todos los argumentos como lista, usuario, maquina, segundos abierto, numero aleatorio, numero de lineas
echo $0 $# $@ $? $$ $* $USER $HOSTNAME $SECONDS $RANDOM $LINENO

#Como echo pero admite operaciones (hay que usar espacios)
expr 1 + 2
expr $var1 - $var2
#Para multiplicar o dividir hay que escapar el caracter con \
expr 2 \* 2
expr 2 \/ 2

#Con echo, el ` obliga la ejecucion de su interior (simbolo de tilde reversa)
echo `expr $var1 + 5`
#Tambien se puede con $()
echo $(expr 1 + 1)
echo $((1+1))
#Similar a las pipes, los > y >> tambien funcionarian
echo | expr 4 + 4


#Para recibir texto por consola, volcandolo a una variable (el script se pausa)
entrada=a
read entrada
echo $entrada
#Con ' se pone talcual pero con " si se interpretan las variables
echo '$entrada'

#Hace referencia a los parametros en orden introducidos al ejecutar el script
echo $1 $2 $3
#Hace referencia al numero de parametros introducidos
echo $#
#Es una lista con todos los parametros incluyendo el 0(nombre del script)
echo $*


#Condicional if,  -eq:=  -gt:>  -lt:<  -ne:!=  -ge:>=  -le <=  (en las condiciones los numeros van con '')
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
#Comprobar varias condiciones, -o: or   -a: and
if [ $var1 -gt 2 -o $var1 -eq 10 ]
then
    echo "verdadero"
fi
#Comprobacion de archivos: -f ruta (fichero normal)   -d ruta (directorio)   -l (enlace)   -x ruta (ejecutable)   -s ruta (pesa mas que 0)
#Comprobacion de strings: "$var" = "asdf" (si son iguales)   -z string (vacia)   "$var" != "asdf" (si no son iguales)    


#Condicional case para evaluar una variable (funciona igual con numeros y texto) (;; al final para cambiar)
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


#Bucle while basico (tambien se puede usar until)
while [ $var1 -lt '10' ]
do
    echo -n $var1
    var1=`expr $var1 + 1`
    #Saltar esa iteracion para ir a la siguiente ignorando el proximo codigo
    continue
    #Sale del bucle ignorando el proximo codigo
    break
done

#Cuando done recible un archivo con < la primera variable de read recibira el contenido de la linea i
linea=”a”
while [ ! -z "$linea" ]
do
    #Recibe lo del < del done
    read linea
    #Comprueba si la linea no es null / no es el eof
    if [ ! -z "$linea" ]
    then
        echo "$linea"
    else
        break
    fi
done < ./script.sh

#Igual que el while pero suma solo usando una variable como contador (en este caso itera "1 2 3 4 5" pero tambien valdria texto (sin comillas))
for var1 in 1 2 3 4 5
do
    echo $var1
done
#Usando las wildcards hace referencia a los archivos de ese directorio (* para todos los archivos)
for var1 in *
do
    echo $var1
done
#Si se usa como entrada un texto lo separara usando el espacio
texto="aa bb cc dd"
for var1 in $texto
do
    echo $var1
done


variablesc=ioio
#Declarar una funcion para ejecutar su codigo mas adelante
funcion(){
    #Las variables siguen siendo globales
    variablesc=asdf
    #A no ser que se use local, entonces solo sirve aqui dentro
    local variablesc=332342
    echo $variablesc
    #Los argumentos son segun los datos que se usen al llamarla
    echo $1
    #Si hay mas de 9 argumentos se especifican asi
    #echo $(10)
}
#Ejecutar la funcion (se pueden poner mas datos como argumentos)
funcion asdfasdfasdf

funcion2(){
    echo sumar
    #Esta funcion devuelve un dato
    return `expr $1 + $2`
}
#Para usar el dato que devuelve una funcion, se llama y se recoge con $?
funcion2 3 7
echo $?

#Con source se pueden recoger variables y funciones de otros scripts
#source ./script2.sh
#funcionexterna

