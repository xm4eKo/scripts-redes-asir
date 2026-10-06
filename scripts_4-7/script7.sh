#!/usr/bin/env bash

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[0m'

if [[ $# -ne 3 ]]; then
  printf "\n%s\n" "${red}[-]${reset} Debes de introducir 3 argumentos" >&2
  exit 1
fi

folder="$1"
pattern="$2"
replacement="$3"

for file in "$folder"/*; do
  if ! sed -i "s/${pattern}/${replacement}/g" "$file" 2>/dev/null; then
    printf "\n%s\n" "${red}[-]${reset} Error al modificar el archivo ${red}"$'\033[4m'"${file}${reset}" >&2
    exit 1
  fi
done
