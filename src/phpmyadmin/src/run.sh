mv /phpMyAdmin-5.0.4-english /var/www/phpmyadmin
rm -rf php*.tar.gz
chmod -R 777 /var/www/

rm /etc/nginx/conf.d/default.conf
mv default.conf /etc/nginx/conf.d/
mv config.inc.php /var/www/phpmyadmin/

rm /etc/telegraf.conf
mv telegraf.conf /etc/

rc

service php-fpm7 start
service nginx start
service telegraf start

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]]; then
          break ;
    fi
done
