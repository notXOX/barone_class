#!/bin/bash

archive=$(zenity --file-selection)
echo "Seleccionaste: $archive"

reemplazar_palabra() {
    old=$(zenity --entry --title="Palabra a modificar" --text="Escriba la palabra a modificar")
    new=$(zenity --entry --title="Palabra nueva" --text="Escriba la palabra nueva")

    nuevo="${archive%.*}_modificado.txt"
    sed "s/$old/$new/g" "$archive" > "$nuevo"
}

while true; do
    option=$(zenity --list --title="Menu de modificacion de archivos" --text="Seleccione el tipo de modificacion" \
    --column="Opciones" --column="Descripcion" \
    "1" "Remplazar una palabra por otra" \
    "2" "Eliminar todas las lineas que contengan una palabra" \
    "3" "Convertir todo a minusculas o mayusculas" \
    "4" "Salir" \
    --height=350 --width=500)
    
    case $option in
    "1")
        reemplazar_palabra
    ;;
    "2")

    ;;
    "3")

    ;;
    "4")
        exit
    ;;
    *)
        exit
    ;;
    esac
done
