#!/bin/sh

# Vérifier si le fichier a été fourni en argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 fichier_commandes"
  exit 1
fi

# Lire le fichier ligne par ligne
while IFS= read -r commande || [ -n "$commande" ]; do
  # Exécuter la commande
  echo "Exécution de : $commande"
  eval "$commande"

  # Vérifier le code de retour
  if [ $? -ne 0 ]; then
    echo "Erreur rencontrée. Arrêt du script."
    exit 1
  fi
done < "$1"

echo "Toutes les commandes ont été exécutées avec succès."
