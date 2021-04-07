rc-status

/etc/init.d/mariadb setup

/usr/bin/mysql_install_db  --datadir=/var/lib/mysql

service mariadb start

mysql -u root -e "CREATE DATABASE wordpress;GRANT ALL ON wordpress.* to 'wp-user'@'localhsot' IDENTIFIED BY 'wp-pass';FLUSH PRIVILEGES;"

mysql < /wordpress.sql -u root wordpress

tail -f /dev/null
