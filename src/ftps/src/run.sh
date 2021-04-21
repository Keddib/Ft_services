#!/bin/sh

rm /etc/vsftpd/vsftpd.conf
mv /src/vsftpd.conf  /etc/vsftpd/
mv /src/telegraf.conf /etc/telegraf.conf

echo -e "1337\n1337" | adduser wolfey

mkdir /home/wolfey/ftp

chown nobody:nogroup /home/wolfey/ftp

chmod a-w /home/wolfey/ftp

mkdir /home/wolfey/ftp/files
chown wolfey:wolfey /home/wolfey/ftp/files

echo "vsftpd test file" | tee /home/wolfey/ftp/files/test.txt

echo "wolfey" | tee -a /etc/vsftpd.userlist

echo "vsftpd test file" | sudo tee /home/wolfey/test.txt

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem \
	-subj "/C=US/ST=BG/L=1337/O=wolfey/CN=wolfey.com"

rc-status

service vsftpd restart

service telegraf start

tail -f /dev/null
