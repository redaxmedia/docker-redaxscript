#!/usr/bin/env bash

git clone https://github.com/redaxscript/redaxscript.git .

composer install
npm install

chmod 777 . -R

grunt serve
