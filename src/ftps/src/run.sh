#!/bin/sh
rm /etc/vsftpd/vsftpd.conf
mv /src/vsftpd.conf  /etc/vsftpd/

<<<<<<< HEAD
echo -e "1337\n1337" | adduser wolfey

mkdir /var/wolfey/ ; mkdir /var/wolfey/pub/

echo "wolfey test file" | tee /var/wolfey/pub/test.txt

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem \
-subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.wolfey.com"


#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
=======
echo "1337\n1337" | adduser wolfey
echo "1337\n1337" | adduser keddib
>>>>>>> 564326ab65ddd925b7cff13ed93192e18e9957a8

echo "vsftpd test file" | sudo tee /home/wolfey/test.txt

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

rc-status

service vsftpd restart

tail -f /dev/null
