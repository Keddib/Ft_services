while [ 1 -eq 1 ]; do
	val=`ps`
	if [[ ! "$val" =~ "telegraf" ]] || [[ ! "$val" =~ "php-fpm7" ]]; then
          break ;
    fi
done
