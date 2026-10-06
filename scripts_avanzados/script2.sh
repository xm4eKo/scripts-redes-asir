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

content=$(/usr/bin/ls -lhS "$folder" | awk 'NR>1 {print "\033[33;1m"$NF"\033[m","\033[34;1m"$5"\033[m","\033[35;1mB\033[m"}')

if [[ -n $content ]]; then
  printf "\n%s\n" "${blue}[+]${reset} Mostrando los archivos ordenador por grandaria:"
  printf "\n%s\n" "$content"
else
  printf "\n%s\n" "${red}[-]${reset} No se han encontrado archivos"
fi