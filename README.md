![Dockernized Redaxscript](https://dummyimage.com/1000x300/323e4c/ffffff&text=Dockernized+Redaxscript)
![Ultra lightweight Content Management System](http://dummyimage.com/1000x100/323e4c/ffffff&text=Ultra+lightweight+Content+Management+System)


Dockernized Redaxscript
=======================

> Ultra lightweight CMS (Content Management System) for SQLite, MySQL and PostgreSQL.

[![Build Status](https://img.shields.io/travis/redaxmedia/redaxscript-docker.svg?style=flat)](https://travis-ci.org/redaxmedia/redaxscript-docker)
[![Docker Automated build](https://img.shields.io/docker/automated/redaxmedia/redaxscript.svg)](https://hub.docker.com/r/redaxmedia/redaxscript/)


Grunt
-----

<pre>docker exec redaxscript grunt {task}</pre>


Database
--------

Modify <code>docker-entrypoint.sh</code> for another database type:

<pre>php console.php config parse --db-url mysql://root:test@mysql/test</pre>

<pre>php console.php config parse --db-url postgres://postgres:test@pgsql/test</pre>

<pre>php console.php config parse --db-url sqlite://test.sqlite</pre>
