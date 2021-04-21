rm /var/www/wordpress/wp-config-sample.php /etc/nginx/conf.d/default.conf

mv wp-config.php /var/www/wordpress/

mv default.conf /etc/nginx/conf.d/

rm /etc/telegraf.conf

mv telegraf.conf /etc/

rc-status

service php-fpm7 start

service nginx start

service telegraf start

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]] || [[ ! "$val" =~ "php-fpm7" ]]; then
          break ;
    fi
done
