#!/usr/bin/env bash

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[0m'

if [[ $# -ne 4 ]]; then
  printf "\n%s\n" "${yellow}[HELP]${reset} Debes de introducir 4 parametros: " >&2
  printf "\t%s\n" "${green}./script.sh <extension> <directorio> <dias> <prefijo>" >&2
  exit 1
fi

ext="$1"
folder="$2"
days="$3"
prefix="$4"

find "$folder" -name "*.${ext}" -mtime $days 2>/dev/null | while read -r line; do
  if ! mv $line $(dirname $line)/${prefix}-$(basename $line) 2>/dev/null; then
    printf "\n%s\n" "${red}[-]${reset} Error al mover el archivo" >&2
    exit 1
  fi
done


if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
  printf "\n%s\n" "${red}[-]${reset} Ha habido un error en la busqueda de los archivos" >&2
  exit 1
fi