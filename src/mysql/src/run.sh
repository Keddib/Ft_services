rm /etc/my.cnf.d/mariadb-server.cnf
mv  mariadb-server.cnf /etc/my.cnf.d/
rm /etc/telegraf.conf
mv telegraf.conf /etc/



rc-status

/etc/init.d/mariadb setup

/usr/bin/mysql_install_db  --datadir=/var/lib/mysql

service mariadb start

service telegraf start

mysql -u root -e "CREATE DATABASE wordpress;GRANT ALL ON wordpress.* to 'wp-user'@'%' IDENTIFIED BY 'wp-pass';FLUSH PRIVILEGES;"

mysql < /wordpress.sql -u root wordpress

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]]; then
          break ;
    fi
done
