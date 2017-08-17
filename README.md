# owncloud-compose

#1.Create docker network

docker ${COMPOSE_OPT} network create -d overlay docker-network

#2.Create secret of CA 

docker secret create ${SSL_CERTIFICATE} ../${SSL_CERTIFICATE}
docker secret create ${SSL_CERTIFICATE_KEY} ../${SSL_CERTIFICATE_KEY}
docker secret create ${SSL_CERTIFICATE_CRT} ../${SSL_CERTIFICATE_CRT}

#3.Create Container

./initiate up -d
