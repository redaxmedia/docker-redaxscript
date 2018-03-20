#!/usr/bin/env bash

git clone https://github.com/redaxscript/redaxscript.git .

composer install
npm install

grunt build

php console.php config parse --db-url mysql://root:test@mysql/test
php console.php uninstall database
php console.php install database --admin-name admin --admin-user admin --admin-password admin --admin-email admin@localhost

php console.php status system
php console.php status database

apache2ctl -D FOREGROUND
