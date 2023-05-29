#!/bin/sh
# Auteurs: Martin Chaperot (20205638) et Adam Lezrek (20235523)
# Ce script permet de convertir un nombre entier en base 10 vers n'importe quelle base entre 2 et 9 incluse.
# Il prend en charge les nombres négatifs, affichant le signe + ou - dans le résultat.
#
# Usage :
# ./encodagePositionnel.sh [nombre entier] [base (2-9)]
#
# Exemple d'utilisation :
# ./encodagePositionnel.sh 4 2
# Output: L'encodage positionnel du nombre 4 en base 2 est +100
#
# Assurez-vous que le fichier est exécutable avec la commande suivante :
# chmod +x encodagePositionnel.sh

# Vérification des arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: ./encodagePositionnel.sh [nombre entier] [base (2-9)]"
    exit 1
fi

nombre=$1
base=$2

# Vérification de la base
if [ "$base" -lt 2 ] || [ "$base" -gt 9 ]; then
    echo "La base doit être un entier compris entre 2 et 9."
    exit 1
fi

# Vérification du nombre
if ! [[ "$nombre" =~ ^-?[0-9]+$ ]]; then
    echo "Le nombre doit être un entier."
    exit 1
fi

signe="+"

# Gestion des nombres négatifs
if [ "$nombre" -lt 0 ]; then
    signe="-"
    nombre=$(( -1 * nombre ))
fi

result=""

# Conversion du nombre
while [ "$nombre" -gt 0 ]; do
    reste=$(( nombre % base ))
    nombre=$(( nombre / base ))
    result="$reste$result"
done

echo "L'encodage positionnel du nombre $1 en base $base est $signe$result"

