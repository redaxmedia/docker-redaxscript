Redaxscript Docker
==================

> A modern, ultra lightweight and rocket fast Content Management System for SQLite, MSSQL, MySQL and PostgreSQL.

[![Build Status](https://img.shields.io/travis/redaxscript/redaxscript-docker.svg)](https://travis-ci.org/redaxscript/redaxscript-docker)


Installation
------------

Clone from GitHub:

```
git clone https://github.com/redaxscript/redaxscript-docker.git
```

Build the services:

```
docker-compose build
```

Create and start the containers:

```
docker-compose up
```


Usage
-----

Run interactive shell inside the container:

```
docker exec -it redaxscript /bin/bash
```

Browse your working copy:

```
http://localhost:8080
```

