FROM alpine:3.11

RUN apk update && apk add openrc libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz \
	&& tar -zxvf grafana-enterprise-7.5.4.linux-amd64.tar.gz

# telegraf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN rm /etc/telegraf.conf

COPY telegraf.conf /etc/

ENTRYPOINT ./setup.sh
