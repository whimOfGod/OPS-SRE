#!/bin/bash

# Configuration
API_URL="http://localhost:1337/api" 

# Nombre total de requêtes à envoyer
TOTAL_REQUESTS=1000

# Fonction pour effectuer une requête HTTP avec curl
make_request() {
  local endpoint=$1
  local method=$2
  local data=$3

  curl -X $method -s "$API_URL/$endpoint" \
    -H "Content-Type: application/json" \
    -d "$data"
}

# Boucle pour envoyer les requêtes
for ((i = 1; i <= TOTAL_REQUESTS; i++)); do
  # Lecture d'articles
  make_request "articles" "GET"

  # Création d'un nouvel article
  make_request "articles" "POST" '{"Title": "Nouvel article", "Body": "Contenu de l'\''article"}'

  # Mise à jour du premier article (s'assurer que cela existe)
  make_request "articles/1" "PUT" '{"Body": "Contenu mis à jour"}'

  # Suppression du premier article (s'assurer que cela existe)
  make_request "articles/1" "DELETE"

  # Lecture des catégories
  make_request "categories" "GET"

  echo "Request $i sent"
done

echo "Load simulation completed"


# Configuration
#API_URL="http://localhost:1337/api/articles"  

# Nombre total de requêtes à envoyer
#TOTAL_REQUESTS=100

# Envoi d'une requête HTTP avec curl
#make_request() {
#  curl -X GET -s "$API_URL" \
#    -H "Content-Type: application/json"
#}

# Boucle pour envoyer les requêtesh 
#for ((i = 1; i <= TOTAL_REQUESTS; i++)); do
#  make_request
#  echo "Request $i sent"
#done

#echo "Load simulation completed"

# Exécution du script
# cd strapi-ops-sre
# chmod +x simulate_load.sh
# ./simulate_load.sh


