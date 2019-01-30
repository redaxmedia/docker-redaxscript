#!/usr/bin/env bash

git clone https://github.com/redaxscript/redaxscript.git .

composer install
npm install

grunt build

php console.php status system

chmod 777 . --recursive

apachectl -D FOREGROUND
