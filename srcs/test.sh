#!bin/bash
echo Hello! I\'ll make come SetUp for you!

service nginx start
service nginx status

rm etc/nginx/sites-available/default
cp /default etc/nginx/sites-available/default

cp /phpinfo.php var/www/html

service php7.3-fpm start
service php7.3-fpm status

tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
cp -rp var/www/html/phpmyadmin/config.sample.inc.php var/www/html/phpmyadmin/config.inc.php
