FROM alpine:3.11

RUN apk update && apk add openrc libc6-compat && \
	mkdir /run/openrc && touch /run/openrc/softlevel

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz \
	&& tar -zxvf grafana-enterprise-7.5.4.linux-amd64.tar.gz

RUN mv grafana-7.5.4 grafana

# telegraf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN rm /etc/telegraf.conf

COPY telegraf.conf /etc/

COPY setup.sh .

ENTRYPOINT ./setup.sh
