rm /etc/nginx/conf.d/default.conf
mv default.conf /etc/nginx/conf.d/
mv app /var/www/
rm /etc/telegraf.conf
mv telegraf.conf /etc/

echo -e "1337\n1337" | adduser wolfey

openssl req -x509 -nodes -days 365 \
-subj "/C=MA/ST=BG/O=1337, Inc./CN=wolfey" \
-addext "subjectAltName=DNS:wolfey.com" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-wolfey.key \
-out /etc/ssl/certs/nginx-wolfey.crt;

rc-status

service nginx start

service sshd start

service telegraf start

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]] || [[ ! "$val" =~ "sshd" ]]; then
          break ;
    fi
done
