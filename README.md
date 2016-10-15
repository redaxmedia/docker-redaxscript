![Dockernized Redaxscript](https://dummyimage.com/1000x300/323e4c/ffffff&text=Dockernized+Redaxscript)
![Ultra lightweight Content Management System](http://dummyimage.com/1000x100/323e4c/ffffff&text=Ultra+lightweight+Content+Management+System)


Dockernized Redaxscript
=======================

> Ultra lightweight CMS (Content Management System) for SQLite, MySQL and PostgreSQL.

[![Build Status](https://img.shields.io/travis/redaxmedia/docker-redaxscript.svg?style=flat)](https://travis-ci.org/redaxmedia/docker-redaxscript)


Database
--------

Modify <code>docker-entrypoint.sh</code> for MySQL:

<pre>php /var/www/html/console.php config parse --db-url mysql://root:test@mysql/test</pre>

Modify <code>docker-entrypoint.sh</code> for PostgreSQL:

<pre>php /var/www/html/console.php config parse --db-url postgres://postgres:test@pgsql/test</pre>

Modify <code>docker-entrypoint.sh</code> for SQLite:

<pre>php /var/www/html/console.php config parse --db-url sqlite://test.sqlite</pre>