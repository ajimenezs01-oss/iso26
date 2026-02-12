#!/bin/bash
#Alejandro Jimenez Silva
#12/02/2026

clear

contador=0
dat=$(date "+%Y-%m-%d")
hor=$(date "+%H:%M")
ta=$(tail -1 /etc/passwd | cut -f 3 -d :)

if [ $UID -ne 0 ]; then
	echo "NO ERES ROOT"
	exit
else
	echo "Bienvenido ROOT"
fi

if [ -z "$1" ]; then
	set -- 1000
fi

if [ "$1" -gt "$ta" ]; then
	clear
	echo "Error: el parámetro es mayor que el UID máximo"
	exit
fi

echo "====================================================="
echo "Informe de usuarios el día $dat a las $hor"

x=$(cut -f 3 -d ":" /etc/passwd | grep '^[0-9]\+$')

for i in $x; do
	if [ "$i" -ge "$1" ]; then
		contador=$((contador+1))
		b=$(grep ":$i:" /etc/passwd | cut -f 1 -d :)
		echo "$b -- $i"
	fi
done

echo "Total: $contador usuarios"
echo "====================================================="

if [ ! -f "/tmp/logeventos" ]; then
	touch "/tmp/logeventos"
else
	echo "$dat -- $hor -- El usuario $USER ha solicitado un informe de usuarios" >> "/tmp/logeventos"
fi
