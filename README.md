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
