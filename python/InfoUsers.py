#!/usr/bin/env python3

import os
import cpuinfo

def es_root():
    return os.geteuid() == 0

def info():
    print("\n--- SISTEMA ---")
    datos = os.uname()
    print("Sistema:", datos.sysname)
    print("Version:", datos.release)

    print("\n--- CPU ---")
    cpu = cpuinfo.get_cpu_info()
    print("Modelo:", cpu["brand_raw"])

def usuario():
    nombre = input("Usuario: ")

    f = open("/etc/passwd", "r")
    lineas = f.readlines()
    f.close()

    existe = False

    for l in lineas:
        if l.startswith(nombre + ":"):
            print("Existe:", l)
            existe = True
            break

    if not existe:
        print("No existe, creando...")
        os.system("useradd " + nombre)

def directorio():
    ruta = input("Directorio: ")

    if os.path.exists(ruta):
        if os.path.isdir(ruta):
            print("Ya existe")
        else:
            print("No es directorio")
    else:
        os.mkdir(ruta)
        print("Creado")

if not es_root():
    print("Ejecuta como root")
else:
    while True:
        print("\n1. Info sistema")
        print("2. Usuario")
        print("3. Directorio")
        print("4. Salir")

        op = input("Opcion: ")

        match op:
            case "1":
                info()
            case "2":
                usuario()
            case "3":
                directorio()
            case "4":
                print("Saliendo...")
                break
            case _:
                print("Opcion no valida")