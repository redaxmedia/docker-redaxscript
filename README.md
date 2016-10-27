Dockernized Redaxscript
=======================

> Ultra lightweight CMS (Content Management System) for SQLite, MySQL and PostgreSQL.

[![Build Status](https://img.shields.io/travis/redaxmedia/redaxscript-docker.svg?style=flat)](https://travis-ci.org/redaxmedia/redaxscript-docker)
[![Docker Automated build](https://img.shields.io/docker/automated/redaxmedia/redaxscript.svg)](https://hub.docker.com/r/redaxmedia/redaxscript/)
[![GitHub Stats](https://img.shields.io/badge/github-stats-ff5500.svg)](http://githubstats.com/redaxmedia/redaxscript-docker)


Grunt
-----

<pre>docker exec redaxscript grunt {task}</pre>


Database
--------

Modify <code>docker-entrypoint.sh</code> for another database type:

<pre>php console.php config parse --db-url mysql://root:test@mysql/test</pre>

<pre>php console.php config parse --db-url postgres://postgres:test@pgsql/test</pre>

<pre>php console.php config parse --db-url sqlite://test.sqlite</pre>
