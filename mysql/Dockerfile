FROM alpine:3.11

RUN apk update && apk add openrc mysql mysql-client

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

RUN rm /etc/my.cnf.d/mariadb-server.cnf

COPY mariadb-server.cnf /etc/my.cnf.d/

COPY run.sh .

COPY wordpress.sql .

ENTRYPOINT sh run.sh
