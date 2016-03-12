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

start more nodemanager
```
docker-compose up spark-yarn-nodemanager2
docker-compose up spark-yarn-nodemanager3
```

# docker-cloud.yml
replace 172.17.0.6 with your master ip
```
spark-yarn-master:
  image: 'jpizarrom/spark-yarn:1.6.0-master'
  command: '/etc/bootstrap-master.sh -d'
  environment:
    - SPARK_PUBLIC_DNS=$DOCKERCLOUD_CONTAINER_FQDN
  hostname: sandbox
  ports:
    - '8042:8042'
    - '8088:8088'
    - '50070:50070'

spark-yarn-nodemanager:
  image: 'jpizarrom/spark-yarn:1.6.0-nodemanager'
  command: '/etc/bootstrap-nodemanager.sh -d'
  environment:
    - SPARK_PUBLIC_DNS=$DOCKERCLOUD_CONTAINER_FQDN
  extra_hosts:
    - 'sandbox:172.17.0.6'
  ports:
    - '8042'
  target_num_containers: 2
```

## Testing

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
--driver-memory 1g \
--executor-memory 1g \
--executor-cores 1 \
$SPARK_HOME/lib/spark-examples-1.6.0-hadoop2.6.0.jar
```
