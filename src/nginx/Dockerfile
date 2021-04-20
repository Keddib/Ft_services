FROM alpine:3.11

RUN apk update && apk add nginx openrc openssl

RUN mkdir /run/openrc && touch /run/openrc/softlevel

RUN rm /etc/nginx/conf.d/default.conf

COPY default.conf /etc/nginx/conf.d/

COPY /app /var/www/

COPY run.sh .

ENTRYPOINT sh run.sh
