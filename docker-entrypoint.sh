#!/bin/bash

cd /var/www/html
rm -rf /var/www/html
git clone https://github.com/redaxmedia/redaxscript.git .

composer install

chmod -R 777 /var/www/html/

php /var/www/html/console.php config parse --db-url mysql://root:test@mysql/test
php /var/www/html/console.php install database --admin-name admin --admin-user admin --admin-password admin --admin-email admin@localhost
php /var/www/html/console.php status database

chmod 444 /var/www/html/config.php

/usr/sbin/apachectl -DFOREGROUND
