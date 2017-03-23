#!/bin/bash


while :
do
    now=`date "+%Y-%m-%d %H:%M:%S"`
    php_fpm_alive=`ps -ef|grep php-fpm|grep -v grep|wc -l`
    if [ $php_fpm_alive -eq 0 ]; then
        echo "[$now] php_fpm is dead!"
        /usr/local/php/sbin/php-fpm
    else
        echo "[$now] php-fpm is alive(^_^)"
    fi


    nginx_alive=`ps -ef|grep nginx|grep -v grep|wc -l`
    if [ $nginx_alive -eq 0 ]; then
        echo "[$now] nginx is dead!"
        /usr/local/nginx/sbin/nginx
    else
        echo "[$now] nginx is alive(^_^)"
    fi

    sleep 5
done
