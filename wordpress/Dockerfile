FROM alpine:3.11

RUN apk update && apk add nginx openrc php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-json

RUN mkdir /run/openrc && touch /run/openrc/softlevel

RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN mv wordpress /var/www/

RUN rm /var/www/wordpress/wp-config-sample.php /etc/nginx/conf.d/default.conf

COPY wp-config.php /var/www/wordpress/

COPY default.conf /etc/nginx/conf.d/

COPY run.sh .

ENTRYPOINT sh run.sh
