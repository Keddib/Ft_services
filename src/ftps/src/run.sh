rm /etc/vsftpd/vsftpd.conf
mv /src/vsftpd.conf  /etc/vsftpd/
echo "1337\n1337" | adduser wolfey
mkdir /home/wolfey/ftp
chown nobody:nogroup /home/wolfey/ftp
chmod a-w /home/wolfey/ftp
mkdir /home/wolfey/ftp/upload
chown wolfey:wolfey /home/wolfey/ftp/upload
echo "vsftpd test file" | sudo tee /home/wolfey/ftp/upload/test.txt
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem


rc-status

rc-update add vsftpd default

service vsftpd restart

tail -f /dev/null
