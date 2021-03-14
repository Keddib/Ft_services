FROM alpine:3.11

RUN apk update && apk add nginx openrc

RUN mkdir /run/openrc && touch /run/openrc/softlevel

RUN apk add php7 php7-fpm php7-opcache

RUN apk add php7-gd php7-mysqli php7-zlib php7-curl php7-json



