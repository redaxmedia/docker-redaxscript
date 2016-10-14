#!/bin/bash

cd /var/www/html
rm -rf /var/www/html
git clone https://github.com/redaxmedia/redaxscript.git .

composer install --ignore-platform-reqs

chmod -R 777 /var/www/html/

php /var/www/html/console.php config parse --db-url mysql://root:test@mysql_database/test
php /var/www/html/console.php install database --admin-name admin --admin-user admin --admin-password admin --admin-email info@redaxmedia.com

chmod 444 /var/www/html/config.php

/usr/sbin/apachectl -DFOREGROUND
