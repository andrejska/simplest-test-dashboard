# simplest-test-dashboard
## What is this?
Simplest test measurement dashboard for performance testing with InfluxDB as time series data base and Grafana as data visualization platform


As an illustration for my conference talk on mobile web games loading time testing


This was simplest idea of a test using Linux tools which came to my mind


Size of downloaded content from site on disc is tested. 
Please take into account that almost all web servers are using gzip compression, so size on wire and on disc is different.

## How to run?
#### Prerequierments
[git](https://git-scm.com/downloads)<br />
[docker engine](https://www.docker.com/get-docker)<br />
[docker-compose](https://docs.docker.com/compose/install/)

#### Start InfluxDB & Grafana
```bash
git clone https://github.com/andrejska/simplest-test-dashboard
cd simplest-test-dashboard
docker-compose up -d
```

#### Run test
`docker exec -t simplesttestdashboard_testrunner_1 ./runner.sh http://host/endpoint ["comment" ["comma separated tags"]]`<br />
###### Example
`docker exec -t simplesttestdashboard_testrunner_1 ./runner.sh http://google.lv`<br />
`docker exec -t simplesttestdashboard_testrunner_1 ./runner.sh http://google.lv "informative comment about run"`<br />
`docker exec -t simplesttestdashboard_testrunner_1 ./runner.sh http://google.lv "informative comment about run" "test, second"`
#### See results
[http://localhost:3000/d/zcy-lIziz](http://localhost:3000/d/zcy-lIziz)

#### See results (Windows OS below Windows 10 Pro/Enterprise using Docker Toolbox)
Get IP address of VM on which docker engine is running:<br />
`docker-machine ip`<br />
Replace localhost in previous link with returned IP address

#### Debugging
##### How to access InfluxDB shell?
`docker run --rm --network=simplesttestdashboard_default --link=simplesttestdashboard_influxdb_1 -it influxdb:1.4.3 influx --host influxdb`

## Why test script is in Bash?
This is to demo that InfluxDB has HTTP API and not to focus on specific high level language 

#### What about Java?
Yes, [it is very straight forward and human readable](https://github.com/influxdata/influxdb-java)

#### What about Python?
Sure, [these are most popular bindings for InfluxDB](https://github.com/influxdata/influxdb-python)

#### What about other languages?
There are official bindings for Ruby, Node.JS and many other languages<br />
Even if your favorite language does not have InfluxDB bindings you can use HTTP API :)

## Where I can see talk?
TBA
