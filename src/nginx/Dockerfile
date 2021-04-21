FROM alpine:3.11
RUN apk update && apk add nginx openrc openssl


RUN mkdir /run/openrc && touch /run/openrc/softlevel && \
	rm /etc/nginx/conf.d/default.conf

COPY default.conf /etc/nginx/conf.d/

COPY app /var/www/app

COPY run.sh .

# telegraf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN rm /etc/telegraf.conf

COPY telegraf.conf /etc/

ENTRYPOINT sh run.sh
