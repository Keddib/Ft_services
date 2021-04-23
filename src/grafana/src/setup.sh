export PATH="/grafana/bin:$PATH"

rm /etc/telegraf.conf

mv telegraf.conf /etc/

rc-status

service telegraf start

grafana-server --homepath "/grafana" > /dev/null 2>&1 &

mkdir -p /grafana/data

mv grafana.db /grafana/data/

#grafana-cli --homepath "/grafana" admin reset-admin-password wolfey1337

while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]]; then
          break ;
    fi
done
