# docker-compose
create network
```
docker network create --driver bridge my-net
```

start namenode, datanode, resourcemanager
```
docker-compose up spark-yarn-master
```

start nodemanager
```
docker-compose up spark-yarn-nodemanager
```

start client
```
docker-compose up spark-yarn-client
```

start more nodemanager
```
docker-compose up spark-yarn-nodemanager2
docker-compose up spark-yarn-nodemanager3
```

# [docker-cloud.yml](docker-cloud.yml)
replace sandbox ip with your master ip

## Testing

in spark-yarn-client

### YARN-cluster mode

In yarn-cluster mode, the Spark driver runs inside an application master process which is managed by YARN on the cluster, and the client can go away after initiating the application.

Estimating Pi (yarn-cluster mode):

```
# execute the the following command which should write the "Pi is roughly 3.1418" into the logs
# note you must specify --files argument in cluster mode to enable metrics
spark-submit \
--class org.apache.spark.examples.SparkPi \
--files $SPARK_HOME/conf/metrics.properties \
--master yarn-cluster \
--driver-memory 1g \
--executor-memory 1g \
--executor-cores 1 \
$SPARK_HOME/lib/spark-examples-1.6.0-hadoop2.6.0.jar
```

Estimating Pi (yarn-client mode):

```
# execute the the following command which should print the "Pi is roughly 3.1418" to the screen
spark-submit \
--class org.apache.spark.examples.SparkPi \
--master yarn-client \
--driver-memory 512m \
--executor-memory 256m \
--executor-cores 1 \
$SPARK_HOME/lib/spark-examples-1.6.0-hadoop2.6.0.jar
```

```
cd $HADOOP_PREFIX
# run the mapreduce
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0.jar grep input output 'dfs[a-z.]+'

# check the output
bin/hdfs dfs -cat output/*
```
