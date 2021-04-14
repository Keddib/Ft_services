#!/bin/bash

kubectl delete rc --all
kubectl delete svc --all
kubectl delete po --all
kubectl delete configmap --all -n ns metallb-system

minikube stop
minikube delete

minikube start --driver=virtualbox --memory='3000'

minikube addons enable metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
#next line is only when you use mettallb for first time
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./src/yamlFiles/metalLB-config.yaml

eval $(minikube docker-env)

docker build -t mysql-img ./src/mysql
docker build -t wordpress-img ./src/wordpress
docker build -t phpmyadmine-img ./src/phpmyadmin

kubectl apply -f ./src/yamlFiles/mysql-rc.yaml
kubectl apply -f ./src/yamlFiles/wp-rc.yaml