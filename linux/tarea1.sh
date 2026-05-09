#!/bin/bash

archive=$(zenity --file-selection)
echo "Seleccionaste: $archive"

# Validar si canceló la operación
[ -z "$archive" ] && exit

# Validar si el archivo existe
if [ ! -f "$archive" ]; then
    zenity --error --text="El archivo no existe"
    exit
fi

# Funciones del script
reemplazar_palabra() {
    old=$(zenity --entry --title="Palabra a modificar" \
    --text="Escriba la palabra a modificar")

    [ -z "$old" ] && return # Significa que si la variable esta vacía, retorne al inicio

    new=$(zenity --entry --title="Palabra nueva" \
    --text="Escriba la palabra nueva")

    [ -z "$new" ] && return

    nuevo="${archive%.*}_modificado.txt"
    sed "s/$old/$new/g" "$archive" > "$nuevo"

    zenity --info --text="Archivo guardado como:\n$nuevo"
}

eliminar_lineas() {
    word=$(zenity --entry --title="Eliminar lineas que contengan una palabra" \
    --text="Ingrese la palabra")

    [ -z "$word" ] && return
    
    nuevo="${archive%.*}_modificado.txt"
    sed "/$word/d" "$archive" > "$nuevo"

    zenity --info --text="Archivo guardado como:\n$nuevo"
}

convertir_texto() {
    op=$(zenity --list --title="Menu de conversion de texto" \
    --column="Opciones" \
    "Mayusculas" \
    "Minusculas")

    [ -z "$op" ] && return

    nuevo="${archive%.*}_modificado.txt"

    if [ "$op" = Mayusculas ]; then
        tr '[:lower:]' '[:upper:]' < "$archive" > "$nuevo"
    else 
        tr '[:upper:]' '[:lower:]' < "$archive" > "$nuevo"
    fi

    zenity --info --text="Archivo guardado como:\n$nuevo"
}

while true; do
    option=$(zenity --list --title="Menu de modificacion de archivos" --text="Seleccione el tipo de modificacion" \
    --column="Opciones" --column="Descripcion" \
    "1" "Reemplazar una palabra por otra" \
    "2" "Eliminar todas las lineas que contengan una palabra" \
    "3" "Convertir todo a minusculas o mayusculas" \
    "4" "Salir" \
    --height=350 --width=500)
    
    case $option in
    "1")
        reemplazar_palabra
    ;;
    "2")
        eliminar_lineas
    ;;
    "3")
        convertir_texto
    ;;
    "4")
        exit
    ;;
    *)
        exit
    ;;
    esac
done
