#!/bin/sh -ex

if [ ! -f /var/lib/cert/cert.pem ]; then
    mkdir -p /var/lib/cert
    openssl req -subj "/CN=${SOURCE_HOST}" -x509 -newkey rsa:4096 -nodes -keyout /var/lib/cert/key.pem -out /var/lib/cert/cert.pem -days 365
fi

if [ ! -f /etc/nginx/conf.d/default-ssl.conf ]; then
    sed -e "s/{TARGET_HOST}/${TARGET_HOST}/g" /tmp/default-ssl.conf.tpl > /etc/nginx/conf.d/default-ssl.conf
fi

nginx -g 'daemon off;'