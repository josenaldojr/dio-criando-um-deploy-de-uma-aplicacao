#!/bin/bash


echo "Criando as imagens..."

docker build -t <username>/projeto-backend:1.0 backend/.
docker build -t <username>/projeto-database:1.0 database/.


echo "Realizando o push das imagens..."

docker push <username>/projeto-backend:1.0
docker push <username>/projeto-database:1.0


echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml


echo "Criando os deployments..."

kubectl aplly -f ./deployment.yml
