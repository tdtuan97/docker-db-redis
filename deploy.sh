# Remove & Create sharing network
#docker network rm d2e_network
#docker network create d2e_network

# Run DB container
docker compose down && docker compose up -d --build