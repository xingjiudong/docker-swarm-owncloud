#!/bin/bash
set -e

sed -i 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/\/run\/secrets\/${SSL_CERTIFICATE}/'  /etc/apache2/sites-available/default-ssl.conf
sed -i 's/\/etc\/ssl\/private\/ssl-cert-snakeoil.key/\/run\/secrets\/${SSL_CERTIFICATE_KEY}/'  /etc/apache2/sites-available/default-ssl.conf

cat /run/secrets/${SSL_CERTIFICATE_CRT} >> /var/www/html/resources/config/ca-bundle.crt

ln -s /etc/apache2/mods-available/socache_shmcb.load /etc/apache2/mods-enabled/socache_shmcb.load
ln -s /etc/apache2/mods-available/ssl.conf /etc/apache2/mods-enabled/ssl.conf
ln -s /etc/apache2/mods-available/ssl.load /etc/apache2/mods-enabled/ssl.load

envsubst < /etc/apache2/sites-available/default-ssl.conf  > /etc/apache2/sites-enabled/000-default.conf

exec "apache2-foreground"
