#!/bin/bash

carpeta=""
opcion=""

echo "Quiere crear una carpeta? s/n"
read opcion

if [ $opcion = "s" ];then
	echo "Ingrese el nombre de una carpeta"
	read carpeta
	mkdir $carpeta # El signo "$" me permite leer el valor de una variable

else
	echo "No se creo la carpeta"
fi
