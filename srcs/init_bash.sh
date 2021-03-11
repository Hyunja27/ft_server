#!bin/bash
echo [Hello! I\'ll make come SetUp for you]!

rm etc/nginx/sites-available/default
cp /default etc/nginx/sites-available/default

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt 
mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

cp /phpinfo.php var/www/html

tar -xzf wordpress-5.7.tar.gz -C /var/www/html/

service php7.3-fpm start
service php7.3-fpm status

service mysql start

mysql -e "CREATE DATABASE spark_press;"
mysql -e "USE spark_press;"
mysql -e "CREATE USER 'spark'@'localhost' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON spark_press.* TO 'spark'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
cd phpmyadmin
cp -rp config.sample.inc.php config.inc.php
cd ..
mv phpmyadmin /var/www/html/

service mysql reload
service php7.3-fpm reload
echo ===============================================
echo = make all ft_server\'s requirement! enjoy it! =
echo ===============================================
nginx -g "daemon off;" 