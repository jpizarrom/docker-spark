# docker-compose
create network
```
docker network create --driver bridge my-net
```

start namenode, datanode, resourcemanager
```
docker-compose up sequenceiq-spark-master
```

start nodemanager
```
docker-compose up sequenceiq-spark-nodemanager
```

start more nodemanager
```
docker-compose up sequenceiq-spark-nodemanager2
docker-compose up sequenceiq-spark-nodemanager3
```

# docker-cloud.yml
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
  links:
    - 'jpizarrom-spark-yarn-master:sandbox'
  ports:
    - '8042'
  target_num_containers: 2
```
