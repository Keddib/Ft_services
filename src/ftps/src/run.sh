#!/bin/sh
rm /etc/vsftpd/vsftpd.conf
mv /src/vsftpd.conf  /etc/vsftpd/

echo -e "1337\n1337" | adduser wolfey

mkdir /var/wolfey/ ; mkdir /var/wolfey/pub/

echo "wolfey test file" | tee /var/wolfey/pub/test.txt

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem \
-subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.wolfey.com"


#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem


rc-status

rc-update add vsftpd default

service vsftpd restart

tail -f /dev/null
