#!/bin/bash
set -e

if [ -z "$ZOOKEEPER_NAME" ]; then
	echo "Missing linked zookeeper container"
	exit 1
fi

IP=$(hostname --ip-address)

sed 's/zookeeper.connect=localhost:2181/'zookeeper.connect=${ZOOKEEPER_PORT_2181_TCP_ADDR}:${ZOOKEEPER_PORT_2181_TCP_PORT}'/' -i config/server.properties
sed 's/#advertised.host.name=<hostname routable by clients>/'advertised.host.name=$IP'/' -i config/server.properties
sed 's/#host.name=localhost/'host.name=$IP'/' -i config/server.properties

exec "$@"
