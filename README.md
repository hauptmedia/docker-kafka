# docker-kafka

```bash
docker run -d \
-e BROKER_ID=1 \
-e LOG_DIRS=/tmp/kafka-logs \
-e ZOOKEEPER_CONNECT=zk1:2181,zk2:2181,zk3:2181 \
hauptmedia/kafka
```
