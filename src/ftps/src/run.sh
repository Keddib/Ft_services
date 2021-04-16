rm /etc/vsftpd/vsftpd.conf
mv /src/vsftpd.conf  /etc/vsftpd/

echo "1337\n1337" | adduser wolfey
echo "1337\n1337" | adduser keddib

echo "vsftpd test file" | sudo tee /home/wolfey/test.txt

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

rc-status

service vsftpd restart

tail -f /dev/null
