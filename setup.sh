#!/bin/sh

minikube start #start the cluser

eval $(minikube -p minikube docker-env) # point our shell to minikube's docker-daemon

docker build -t mysql-img ./srcs/mysql
docker build -t wordpress-img ./srcs/wordpress
docker build -t phpmyadmine-img ./srcs/phpmyadmine

# docker build -t mysql-img ./srcs/mysql
# docker build -t mysql-img ./srcs/mysql
# docker build -t mysql-img ./srcs/mysql
# docker build -t mysql-img ./srcs/mysql
