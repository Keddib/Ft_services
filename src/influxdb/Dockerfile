FROM alpine:3.11

RUN apk update && apk add influxdb openrc && \
	mkdir /run/openrc && touch /run/openrc/softlevel

WORKDIR /source/

COPY src .

# telegraf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ENTRYPOINT ./setup.sh
