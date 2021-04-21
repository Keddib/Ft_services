FROM alpine:3.11

RUN apk update && apk add influxdb openrc && \
	mkdir /run/openrc && touch /run/openrc/softlevel

COPY setup.sh .

# telegraf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN rm /etc/telegraf.conf

COPY telegraf.conf /etc/

ENTRYPOINT ./setup.sh
