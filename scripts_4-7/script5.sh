#!/usr/bin/env bash

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[m'

if [[ $# -ne 1 ]]; then
  printf "\n%s\n" "${red}[-]${reset} Debes de introducir un parametro." >&2
  exit 1
fi

folder="$1"

total_files=$(find "$folder" -type f | wc -l)
printf "\n%s\n" "${blue}[+]${reset} Hay un total de ${magenta}$total_files${reset} archivos en la carpeta ${green}"$'\033[4m'"$folder${reset}"