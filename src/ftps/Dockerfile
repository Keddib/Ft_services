FROM alpine:3.11

RUN apk update && apk add openrc openssl vsftpd

RUN mkdir /run/openrc && touch /run/openrc/softlevel

COPY src/* /src/

ENTRYPOINT sh /src/run.sh
