#!/bin/bash

minikube stop
minikube delete


minikube start --driver=virtualbox --memory='3000'

#create new namespace for metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml

#create metallb resources (speaker and controller)
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

#create metallb configmap
kubectl apply -f ./src/yamlFiles/metalLB-config.yaml

#connect to minikube docker-daemon

eval $(minikube docker-env)

#build images on minikube docker daemon

docker build -t mysql-img ./src/mysql
docker build -t wordpress-img ./src/wordpress
docker build -t phpmyadmin-img ./src/phpmyadmin
docker build -t ftps-img ./src/ftps
docker build -t nginx-img ./src/nginx
docker build -t grafana-img ./src/grafana
docker build -t influxdb-img ./src/influxdb

kubectl apply -f ./src/yamlFiles/mysql.yaml
kubectl apply -f ./src/yamlFiles/wordpress.yaml
kubectl apply -f ./src/yamlFiles/phpmyadmin.yaml
kubectl apply -f ./src/yamlFiles/ftps.yaml
kubectl apply -f ./src/yamlFiles/nginx.yaml
kubectl apply -f ./src/yamlFiles/influxdb.yaml
kubectl apply -f ./src/yamlFiles/grafana.yaml
