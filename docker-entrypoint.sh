#!/bin/sh

rm -rf /var/www/html
git clone https://github.com/redaxmedia/redaxscript.git .

composer install
IED_CACHE_DIR=.tmp ied install

chmod -R 777 /var/www/html/
php console.php config parse --db-url mysql://root:test@mysql/test
php console.php install database --admin-name admin --admin-user admin --admin-password admin --admin-email admin@localhost
php console.php status database
chmod 444 config.php

/usr/sbin/apachectl -DFOREGROUND
