FROM alpine:3.11

RUN apk update && apk add bash nginx openrc php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-json

RUN mkdir /run/openrc && touch /run/openrc/softlevel

RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN mv wordpress /var/www/

WORKDIR /source/

COPY src .

# telegraf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ENTRYPOINT bash run.sh
