#!/bin/bash

kubectl delete rc --all
kubectl delete svc --all
kubectl delete po --all
kubectl delete configmap --all -n ns metallb-system

minikube stop
minikube delete

minikube start --driver=virtualbox --memory='3000'

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./src/yamlFiles/metalLB-config.yaml

eval $(minikube docker-env)

docker build -t mysql-img ./src/mysql
docker build -t wordpress-img ./src/wordpress
docker build -t phpmyadmin-img ./src/phpmyadmin
docker build -t ftps-img ./src/ftps

kubectl apply -f ./src/yamlFiles/mysql-rc.yaml
kubectl apply -f ./src/yamlFiles/wp-rc.yaml
