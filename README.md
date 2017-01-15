Dockernized Redaxscript
=======================

> Ultra lightweight Content Management System for SQLite, MySQL and PostgreSQL.

[![Build Status](https://img.shields.io/travis/redaxmedia/redaxscript-docker.svg)](https://travis-ci.org/redaxmedia/redaxscript-docker)
[![Docker Automated build](https://img.shields.io/docker/automated/redaxmedia/redaxscript.svg)](https://hub.docker.com/r/redaxmedia/redaxscript)
[![GitHub Stats](https://img.shields.io/badge/github-stats-ff5500.svg)](http://githubstats.com/redaxmedia/redaxscript-docker)


Terminal
--------

Docker pull command:

```
docker pull redaxmedia/redaxscript
```

Build or rebuild services:

```
docker-compose build
```

Create and start containers:

```
docker-compose up
```


Database
--------

Modify `docker-entrypoint.sh` for another database type:

```
php console.php config parse --db-url mysql://root:test@mysql/test
```

```
php console.php config parse --db-url postgres://postgres:test@pgsql/test
```

```
php console.php config parse --db-url sqlite://test.sqlite
```


Grunt
-----

Run Grunt inside the container:

```
docker exec redaxscript grunt {task}
```


Browser
-------

```
http://localhost:8080
```
