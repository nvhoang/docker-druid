Docker Druid
================

Tags:

- 0.9.1.1, 0.9, latest ([Dockerfile](https://github.com/znly/docker-druid/blob/master/Dockerfile))

What is Druid?
==================

Druid is an open-source analytics data store designed for business intelligence (OLAP) queries on event data. Druid provides low latency (real-time) data ingestion, flexible data exploration, and fast data aggregation. Existing Druid deployments have scaled to trillions of events and petabytes of data. Druid is most commonly used to power user-facing analytic applications.


How to use?
===========

Druid being a complex system, the best way to get up and running with a cluster is to use the docker-compose file provided. 


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

Documentation
=============

Work in progress

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
