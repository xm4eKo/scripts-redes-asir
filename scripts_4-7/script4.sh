#!/usr/bin/env bash

# Modificado desde produccion

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[m'


if [[ $# -lt 2 ]]; then
  printf "\n%s\n" "${red}[-]${reset} Debes de introducir dos parametros"
  exit 1
fi

folder1="$1"
folder2="$2"

for file in "$folder1"/*; do
  cp "$file" "$folder2" 2>/dev/null || printf "\n%s\n" "${red}[-]${reset} Ha habido un error en la ejecucion" >&2
done
