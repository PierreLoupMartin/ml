#!/bin/bash

VERT='\033[0;32m'
ROUGE='\033[0;31m'
NC='\033[0m'

echo -e "${VERT}🚀 Git Push Assistant (multi-sélection + * = tout)${NC}"

# Liste des fichiers modifiés ou non suivis
files=($(git status --short | awk '{print $2}'))

if [ ${#files[@]} -eq 0 ]; then
  echo -e "${ROUGE}❌ Aucun fichier modifié ou à ajouter.${NC}"
  exit 0
fi

echo -e "\n📂 Fichiers disponibles à ajouter :"
for i in "${!files[@]}"; do
  echo "$((i+1)). ${files[$i]}"
done

echo -e "\nTape les numéros des fichiers à ajouter (ex: 1 2 3), ou * pour tout :"
read -ra selections

# Gère l’option *
if [[ "${selections[0]}" == "*" ]]; then
  for fichier in "${files[@]}"; do
    git add "$fichier"
  done
else
  for index in "${selections[@]}"; do
    if ! [[ "$index" =~ ^[0-9]+$ ]] || [ "$index" -lt 1 ] || [ "$index" -gt "${#files[@]}" ]; then
      echo -e "${ROUGE}❌ Numéro invalide : $index${NC}"
      exit 1
    fi
    git add "${files[$((index-1))]}"
  done
fi

echo -e "\n📝 Message de commit :"
read -r message

if [ -z "$message" ]; then
  message="Mise à jour depuis le script Git"
fi

git commit -m "$message"
git push

echo -e "\n${VERT}✅ Fichiers ajoutés et poussés avec succès !${NC}"

