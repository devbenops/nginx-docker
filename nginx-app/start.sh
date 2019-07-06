#!/bin/sh
set -e


for index in `env | grep nginx_` ; do
    name=$(echo $index | awk -F"=" '{print $2}') &&
    cp -p /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/$name.conf &&
    sed -i "s/server_name _/server_name $name/" /etc/nginx/conf.d/$name.conf &&
    key=$(echo $index | awk -F"=" '{print $1}') &&
    if [ "$key" == 'nginx_root_domain' ]; then
    	sed -i "s/listen 80/listen 80 default_server/" /etc/nginx/conf.d/$name.conf
        sed -i "s/listen \[::]:80/listen [::]:80 default_server/" /etc/nginx/conf.d/$name.conf
    fi
    done

rm -f /etc/nginx/conf.d/default.conf

exec /usr/sbin/nginx -c /etc/nginx/nginx.conf
