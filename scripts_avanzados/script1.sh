#!/usr/bin/env bash

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[0m'

help_panel(){
  printf "\n%s\n" "${yellow}[?]${reset} Uso: Introduce el nombre del fichero y luego los parametros:" >&2
  printf "\t%s\n" "${red}sudo${reset}${green}./script.sh <nombre-archivo> [-a|-s]${reset}" >&2
  exit 1
}

# Añadimos funcionalidad para detectar si el usuario es root (para github)

if [[ $# -ne 2 && $(id -u) -ne 0 ]]; then
  help_panel
fi

file="$1"
date=$(date "+%d/%m/%Y %H:%M:%S")

case $2 in
  -a) echo $date >> "$file" ;;
  -s) echo $date > "$file" ;;
  *) help_panel ;;
esac
