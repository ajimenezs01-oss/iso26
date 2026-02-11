#!/bin/bash

clear

if [ $# -ne 2 ]; then
	echo "No hay 2 parametros, saliendo..."
	exit
fi

if [ ! -f $1 ]; then
	touch $1
else
	echo "$1 existe, saliendo..."
	exit
fi

if ! ls -l $2 >/dev/null; then
	echo "$2 no tiene contenido, saliendo..."
	exit
fi

echo "Alejandro Jiménez Silva"

s=1

for f in "$2"/*.txt; do
	a=$(cat $f | wc -w)
	if [ $a -ge "5" ]; then
		c=$(cat $f | wc -l)
		echo "El fichero es $f y tiene $a lineas"
		echo $f >> $1
		sum=$(($s+1))
		echo "$s parametros identificados..."
		echo "El fichero original tiene $c palabras" > "$f.q"
		cat "$f" >> "$f.q"
	fi
done
echo "" >> $1
echo "$s parametros identificados..." >> $1
