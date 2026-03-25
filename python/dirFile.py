#Alejandro Jiménez Silva
#ASIR 1
#25/03/2026

import os
import shutil as s

archivos=[]
directorios=[]

f=open("../../../root/PyCharmMiscProject/rutas.txt", "r")
lineas=f.readlines()
f.close()

for linea in lineas:
    ruta= linea.strip()
    if os.path.isfile(ruta):
        archivos.append(ruta)
    elif os.path.isdir(ruta):
        directorios.append(ruta)

def eliminar_fichero():
    nombre=input("Dime el nombre del fichero: ")
    if nombre in directorios and os.path.isfile(nombre):
        os.remove(nombre)
        archivos.remove(nombre)
        print("FIchero eliminado")
    else:
        print("ERROR")

def info_directorio():
    nombre=input("Dime el nombre del directorio: ")
    if nombre in directorios and os.path.isdir(nombre):
        print("Directorio: ",nombre)
        print("Contenido:",os.listdir(nombre))
        print("Ruta absoluta:",os.path.abspath(nombre))
    else:
        print("ERROR")

def copiar_fichero():
    origen=input("Dime el nombre del fichero a copiar: ")
    destino=input("Dime la ruta de destino: ")
    if origen in archivos and os.path.isfile(origen):
        s.copy(origen,destino)
        print("Fichero copiado")
    else:
        print("ERROR")

def mostrar_lista():
    eleccion=input("Mostrar lista de Archivos(A) o Directorios(D): ").upper()
    if eleccion == "A":
        print("Archivos:",archivos)
    elif eleccion == "D":
        print("Directorios:",directorios)
    else:
        print("ERROR")
while True:
    os.system("clear")
    print("-------------------")
    print("A) ELIMINAR FICHERO")
    print("B) INFO DIRECTORIO")
    print("C) COPIAR FICHERO")
    print("D) MOSTRAR LISTA")
    print("E) SALIR")
    print("-------------------")
    opt=input("Opcion: ").upper()
    match opt:
        case "A":
            eliminar_fichero()
        case "B":
            info_directorio()
        case "C":
            copiar_fichero()
        case "D":
            mostrar_lista()
        case "E":
            print("Saliendo...")
            break
        case _:
            print("Opcion no valida")