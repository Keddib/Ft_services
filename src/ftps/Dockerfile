FROM alpine:3.11

RUN apk update && apk add openrc openssl vsftpd

RUN mkdir /run/openrc && touch /run/openrc/softlevel

COPY src/* /src/

# telegraf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN rm /etc/telegraf.conf

ENTRYPOINT sh /src/run.sh
