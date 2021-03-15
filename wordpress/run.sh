rc-status

/etc/init.d/mariadb setup

/usr/bin/mysql_install_db  --datadir=/var/lib/mysql

user="root"

dbname="wordpress"

name="wp-user"

pass="wp-pass"

mysql -u $user -e "CREATE DATABASE $dbname;CREATE USER $name@'localhost' identified by '$pass';GRANT ALL ON *.* to $name@'%' WITH GRANT OPTION;FLUSH PRIVILEGES;"

service mariadb start

service php-fpm7 start

service nginx start

tail -f /dev/null
