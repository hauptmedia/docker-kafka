# docker-kafka

```bash
docker run -d \
-v /mnt/hdd/1/var/lib/kafka/log1:/var/lib/kafka/log1 \
-v /mnt/hdd/2/var/lib/kafka/log2:/var/lib/kafka/log2 \
-e BROKER_ID=1 \
-e LOG_DIRS=/var/lib/kafka/log1,/var/lib/kafka/log2 \
-e ZOOKEEPER_CONNECT=zk1:2181,zk2:2181,zk3:2181 \
hauptmedia/kafka
```
