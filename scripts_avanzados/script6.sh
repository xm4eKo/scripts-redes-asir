#!/usr/bin/env bash

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[0m'


if [[ $# -ne 2 ]]; then
  printf "\n%s\n" "${yellow}[HELP]${reset} Debes de introducir dos parametros:" >&2
  printf "\t%s\n" "${green}./script.sh <directorio> <grandaria (MB)>${reset}" >&2
  exit 1
fi

folder="$1"
size="$2"

content=$(find "$folder" -size +${size}M 2>/dev/null)

if [[ -n $content ]]; then

  if ! find "$folder" -size +${size}M -delete 2>/dev/null; then
    printf "\n%s\n" "${red}[-]${reset} Se ha acontecido algun error" >&2
    exit 1
  fi
  printf "\n%s\n" "${blue}[+]${reset} Se han eliminado los archivos exitosamente"
else
  printf "\n%s\n" "${yellow}[*]${reset} No hay archivos para borrar"
fi
