#!/bin/bash

# Vérifier si la borne est passée en paramètre
if [ $# -eq 0 ]; then
  echo "Veuillez fournir une borne supérieure en tant que paramètre."
  exit 1
fi

# Vérifier si la borne est un entier positif
if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -lt 2 ]; then
  echo "Veuillez fournir une borne supérieure entière positive > 1 en tant que paramètre."
  exit 1
fi

# Fonction pour vérifier si un nombre est premier
is_prime() {
  num=$1
  for (( i=2; i<=$num/2; i++ )); do
    if [ $((num%i)) -eq 0 ]; then
      return 1
    fi
  done
  return 0
}

# Imprimer les nombres premiers
echo "Les nombres premiers jusqu'à la borne supérieure $1 sont :"
for (( num=2; num<=$1; num++ )); do
  if is_prime $num; then
    echo $num
  fi
done

