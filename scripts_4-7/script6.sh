#!/usr/bin/env bash

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[0m'

if [[ $# -ne 1 ]]; then
  printf "\n%s\n" "${red}[-]${reset} Debes de introducir un parametro" >&2
  exit 1
fi

folder="$1"

if ! find "$folder" -type f -mtime +7 -delete 2>/dev/null; then
  printf "\n%s\n" "${red}[-]${reset} Error al buscar o borrar los archivos" >&2
  exit 1
fi