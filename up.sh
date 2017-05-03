source ./env.sh
mkdir -p volumes/druidStorage
mkdir -p volumes/coordinator 
mkdir -p volumes/broker
mkdir -p volumes/overlord
docker-compose up
