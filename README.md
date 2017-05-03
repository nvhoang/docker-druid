Docker Druid
================


```
git clone git@github.com:nvhoang/docker-druid.git
```

and run :

```
docker-compose up
```

The compose file is going to launch :

- 1 [zookeeper](https://hub.docker.com/r/znly/zookeeper/) node
- 1 postgres database

and the following druid services :

- 1 broker
- 1 overlord
- 1 middlemanager
- 1 historical

The image contains the full druid distribution and use the default druid cli. If no command is provided the image will run as a broker.

If you plan to use this image on your local machine, be carefull with the JVM heap spaces required by default (some services are launched with 15gb heap space).

The docker-compose file is setup to run on a macbook.


Quick start
=============
* Run `up.sh` to get up. Logs will be streamed to console.
* Ctrl-C and `down.sh` to destroy.
* When Druid is up, run `index_wiki.sh` to index wiki dataset. Then look at http://localhost:8090 for indexing jobs.
* After indexing, Druid takes few minutes to load up segments, look for blue circle next to wiki datasource at http://localhost:9091
* Once Druid segment is loaded up successfully (i.e. blue circle), run `query_wiki.sh`.


Configuration
=============

Available environment options:

- `DRUID_XMX` '-'
- `DRUID_XMS` '-'
- `DRUID_NEWSIZE` '-'
- `DRUID_MAXNEWSIZE` '-'
- `DRUID_HOSTNAME` '-'

Rebuild
=============
`docker build -t nvhoang/druid:0.9.1.1 .`

Authors
=======

- Jean-Baptiste DALIDO <jb@zen.ly>
- Clément REY <clement@zen.ly>
