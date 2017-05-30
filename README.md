# Apache Drill dockerfile run in distributed mode

This image should let you spin up Drill instances in distributed mode with the greatest of ease. 

## Drill Version: 1.10

## Usage

If you're spinning the images up by hand, they care about the following ENV variables:

* `DRILL_VERSION` : the version of Drill you want to run. Default is 1.10
* `CLUSTER_ID` : the ID of the drill cluster.
* `ZOOKEEPERS` : list of zookeeper instaces. 
* `ENABLE_EXCLUDES` : enable modules that are by default disabled in [hadoop-excludes](https://github.com/apache/drill/blob/master/distribution/src/resources/hadoop-excludes.txt). Format them as a comma separated list.
* `AWS_ACCESS_KEY` : Used by [jets3t](http://www.jets3t.org/). AWS access key to get at S3.
* `AWS_SECRET_KEY` : Used by [jets3t](http://www.jets3t.org/). AWS secret key to get at S3.
* `JETS3T_VERSION` : the version od Jetset. Currently 0.9.3


To run it locally, you can use docker compose.

```yml
version: '2'
services:
  drill:
    image: gaorlov/drill:latest
    depends_on:
      - zookeeper
    links:
      - zookeeper
    environment:
      - CLUSTER_ID=my-drill-cluster
      - ZOOKEEPERS=zookeeper:2181
      - ENABLE_EXPLUDES=jets3t,parquet
      - AWS_ACCESS_KEY=access key
      - AWS_SECRET_KEY=secret key
    ports:
      - 8047
  
  zookeeper:
    image: zookeeper:latest
    ports:
      - 2181
```

## Tested excludes

* `jets3t`
* `parquet`

## Contributing

I can't believe that I couldn't find an official Drill image, so I'm going to try and maintain this. But there are features I will not use, which is where you come in: 

Bug reports and pull requests are welcome on GitHub at https://github.com/gaorlov/drill.