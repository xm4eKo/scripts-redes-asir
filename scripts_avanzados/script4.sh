#!/usr/bin/env bash

# Paleta general de colores
blue=$'\033[34;1m'
red=$'\033[31;1m'
cyan=$'\033[36;1m'
magenta=$'\033[35;1m'
yellow=$'\033[33;1m'
green=$'\033[32;1m'
reset=$'\033[0m'

if [[ $# -ne 1 ]] || (( $1 % 2 != 0 )) || [[ ! $1 =~ ^[0-9]+$ ]]; then
  printf "\n%s\n" "${yellow}[HELP]${reset} Debes de introducir un numero par:" >&2
  printf "\t%s\n" "${green}./script.sh <numero-par>${reset}" >&2
  exit 1
fi

declare -i counter=1
number="$1"
declare -i sum

printf "\n%s\n" "${blue}[+]${reset} Contador actual: ${yellow}1${reset}"

until (( counter > number )); do
  
  if (( counter % 2 == 0 )); then
    printf "%s\n" "${blue}[+]${reset} Contador actual: ${yellow}$counter${reset}"
    ((sum+=counter))
  fi

  ((counter++))
done

printf "\n%s\n" "${blue}[+]${reset} La suma total de numeros pares es: ${yellow}$sum${reset}"