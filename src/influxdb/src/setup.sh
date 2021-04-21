rm /etc/telegraf.conf
mv telegraf.conf /etc/

rc-status

service influxdb start

service telegraf start

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]]; then
          break ;
    fi
done
