
#!/bin/bash

clear

txt=agenda.txt

while true; do

	echo "==========================================="
	echo "MENU DE OPCIONES"
	echo "1- Entrada"
	echo "2- Buscar por DNI"
	echo "3- Ver agenda completa"
	echo "4- Eliminar todas las entradas de la agenda"
	echo "5- Salir"
	echo "==========================================="

	read -p "Dime que opción quieres: " opt

	case $opt in

		1)
			clear
			read -p "Dime el DNI: " dni
			if grep "$dni" agenda.txt >/dev/null ; then
				echo "El DNI introducido está dado de alta"
			else
				echo "El DNI introducido no esta dado de alta"
				echo "Dando de alta a nuevo usuario..."
				read -p "Dime un nombre: " nomb
				read -p "Dime el primer apellido: " ape1
				read -p "Dime el segundo apellido: " ape2
				read -p "Dime la localidad: " loc
				echo "$dni:$nomb:$ape1 $ape2:$loc" >> $txt
			fi
		;;

		2)
			clear
			read -p "Dime un DNI: " dni
			if grep "$dni" agenda.txt >/dev/null ; then
				clear
				echo "El DNI introducido esta dado de alta"
				echo "===================================="
				echo "Mostrando datos del usuario"
				nomb=$(grep "^$dni:" agenda.txt | cut -d ":" -f 2)
				echo "El nombre es $nomb"
				apell=$(grep "^$dni:" agenda.txt | cut -d ":" -f 3)
				echo "Los apellidos son $apell"
				loc=$(grep "^$dni:" agenda.txt | cut -d ":" -f 4)
				echo "La localidad es $loc"
			else
				echo "El DNI no esta dado de alta. Elige la opcion 1 para dar de alta al dni introducido."
			fi
		;;

		3)
			clear
			if [ -f $txt ]; then
				echo "$txt es un fichero"
				if [ -s $txt ]; then
					echo "Mostrando contenido: "
					cat $txt
				else
					echo "$txt no tiene contenido"
				fi
			else
				echo "$txt no es un fichero"
			fi
		;;

		4)
			clear
			echo "Borrando contenido..."
			: > $txt
		;;

		5)
			clear
			echo Saliendo...
			break
		;;

		*)
			echo "El numero introducido no figura en la lista..."
		;;
	esac
done
