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
  printf "\n%s\n" "${yellow}[HELP]${reset} Debes de introducir un directorio:" >&2
  printf "\t%s\n" "${green}./script.sh <directorio>${reset}" >&2
  exit 1
fi

folder="$1"

nr_files=$(find "$folder" -type f 2>/dev/null | wc -l)
nr_folders=$(find "$folder" -mindepth 1 -type d 2>/dev/null | wc -l)

if [[ -n $nr_files || -n $nr_folders ]]; then
  printf "\n%s\n" "${blue}[+]${reset} Se han encontrado ${magenta}$nr_files${reset} archivos y ${magenta}$nr_folders${reset} directorios"
else
  printf "\n%s\n" "${yellow}[?]${reset} No se han encontrado resultados"
fi