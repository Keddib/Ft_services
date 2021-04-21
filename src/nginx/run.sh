openssl req -x509 -nodes -days 365 \
-subj "/C=MA/ST=BG/O=1337, Inc./CN=wolfey" \
-addext "subjectAltName=DNS:wolfey.com" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-wolfey.key \
-out /etc/ssl/certs/nginx-wolfey.crt;

rc-status

service nginx start

service telegraf start

tail -f /dev/null
