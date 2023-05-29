#!/bin/sh
# Auteurs: Martin Chaperot (20205638) et Adam Lezrek (20235523)
# Ce script Shell calcule le Plus Grand Commun Diviseur (PGCD) de deux nombres entiers positifs en utilisant l'algorithme d'Euclide.
# Le script prend deux arguments, les entiers positifs x et y, et affiche le PGCD de ces deux nombres.
#
# Mode d'utilisation :
# 1. Assurez-vous que le script a les autorisations d'exécution : chmod +x pgcd.sh
# 2. Exécutez le script en fournissant deux entiers positifs comme arguments : ./pgcd.sh <nombre1> <nombre2>
# 3. Le script affiche le PGCD des deux nombres fournis.
#
# Exemple :
# $ ./pgcd.sh 18 30
# PGCD de 18 et 30 est 6


# Vérifiez si le nombre de paramètres est correct
if [ $# -ne 2 ]; then
    echo "Erreur : vous devez fournir exactement deux arguments."
    exit 1
fi

# Vérifiez si les arguments sont des entiers positifs
if ! [ "$1" -ge 0 ] 2>/dev/null || ! [ "$2" -ge 0 ] 2>/dev/null; then
    echo "Erreur : les arguments doivent être des entiers positifs."
    exit 1
fi

x=$1
y=$2

# Algorithme d'Euclide pour calculer le PGCD
while [ $x -ne $y ]; do
    if [ $x -gt $y ]; then
        x=$((x - y))
    else
        y=$((y - x))
    fi
done

# Affichez le résultat
echo "PGCD de $1 et $2 est $x"

