#!/bin/bash
set -e

if [ -z "$HOST_NAME" ]; then
	#use container's ip address if host name was specified
	HOST_NAME=$(hostname --ip-address)
fi

if [ -z "$ADVERTISED_HOST_NAME" ]; then
	#use container's ip address if host name was specified
	ADVERTISED_HOST_NAME=$(hostname --ip-address)
fi

sed 's/#advertised.host.name=<hostname routable by clients>/'advertised.host.name=${ADVERTISED_HOST_NAME}'/' -i config/server.properties
sed 's/#host.name=localhost/'host.name=${HOST_NAME}'/' -i config/server.properties

if [ -n "$ZOOKEEPER_CONNECT" ]; then
	sed 's/zookeeper.connect=localhost:2181/'zookeeper.connect=${ZOOKEEPER_CONNECT}'/' -i config/server.properties
fi

exec "$@"
