#!/bin/bash

# Configuration
API_URL="http://strapi:1337/api/article"  # Remplacez par l'URL réelle de votre API

# Nombre total de requêtes à envoyer
TOTAL_REQUESTS=100

# Envoi d'une requête HTTP avec curl
make_request() {
  curl -X GET -s "$API_URL" \
    -H "Content-Type: application/json"
}

# Boucle pour envoyer les requêtes
for ((i = 1; i <= TOTAL_REQUESTS; i++)); do
  make_request
  echo "Request $i sent"
done

echo "Load simulation completed"
