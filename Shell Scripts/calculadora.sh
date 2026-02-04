#!/bin/bash
#Alejandro Jimenez Silva
#04/02/2026

clear
read -p "Dime un fichero destino: " fic
 > $fic
if [ ! -f $fic ]; then
	echo "No es un fichero, saliendo..."
	exit
fi
if [ -s $fic ]; then
	echo "El fichero tiene contenido, saliendo..."
	exit
fi
echo "Autor: Alejandro Jiménez Silva"
read -p "Cuantas operaciones quiere realizar? " rel
for ((num=1; num<=rel; num++)) ; do
	echo "============="
	echo "   1  2  3   "
	echo "   4  5  6   "
	echo "   7  8  9   "
	echo "   S  0  R   "
	echo "   M  D  X   "
	echo "============="

	read -p "Dime el tipo de operación: " operacion
	clear
	echo "Operacion elegida: $operacion"
	read -p "Dime el primer número: " op1
	if [ -z $op1 ]; then
		echo "Valor erroneo, saliendo..."
		exit
	fi
	read -p "Dime el segundo número: " op2
	if [ -z $op2 ]; then
		echo "Valor erroneo, saliendo..."
		exit
	fi
	case $operacion in
		"S")
			echo "$operacion $op1 $op2" >> $fic
			echo
			echo "$op1 + $op2 = $(($op1+$op2))"
			echo
		;;

		"R")
			echo "$operacion $op1 $op2" >> $fic
			echo
                        echo "$op1 - $op2 = $(($op1-$op2))"
                        echo
		;;

		"M")
			echo "$operacion $op1 $op2" >> $fic
			echo
                        echo "$op1 x $op2 = $(($op1*$op2))"
                        echo
		;;

		"D")
			echo "$operacion $op1 $op2" >> $fic
			echo
                        echo "$op1 / $op2 = $(($op1/$op2))"
                        echo
		;;

		"X")
			clear
			echo "Saliendo..."
			break
		;;

		*)
			clear
			echo "El tipo de operación introducido es erroneo"
		;;
	esac
done
echo "Las operaciones han sido: "
cat $fic
