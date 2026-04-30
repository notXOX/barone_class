#!/bin/bash

new_user() {
    usuario=$(zenity --entry --title="Nuevo Usuario" --text="Usuario")
    [ $? -ne 0 ] && return 

    password=
}