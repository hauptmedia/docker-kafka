#!/bin/bash
set -e

IP=$(hostname --ip-address)

if [ -n "$ZOOKEEPER_CONNECT" ]; then
	sed 's/zookeeper.connect=localhost:2181/'zookeeper.connect=${ZOOKEEPER_CONNECT}'/' -i config/server.properties
fi

sed 's/#advertised.host.name=<hostname routable by clients>/'advertised.host.name=$IP'/' -i config/server.properties
sed 's/#host.name=localhost/'host.name=$IP'/' -i config/server.properties

exec "$@"
