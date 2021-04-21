mv grafana.db /grafana/data/
rm /etc/telegraf.conf
mv telegraf.conf /etc/

rc-status

service telegraf start

/grafana/bin/grafana-server --homepath /grafana &

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]]; then
          break ;
    fi
done
