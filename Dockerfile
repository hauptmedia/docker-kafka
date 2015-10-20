FROM		hauptmedia/java:oracle-java7

ENV     	DEBIAN_FRONTEND noninteractive

ENV		SCALA_VERSION		2.10
ENV		KAFKA_VERSION		0.8.2.2
ENV		KAFKA_RELEASE_ARCHIVE	kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
ENV		KAFKA_DOWNLOAD_URL	http://www.us.apache.org/dist/kafka/${KAFKA_VERSION}/${KAFKA_RELEASE_ARCHIVE}

ENV		KAFKA_INSTALL_DIR	/opt/kafka

# install needed debian packages & clean up
RUN		apt-get update && \
		apt-get install -y --no-install-recommends curl tar ca-certificates && \ 
		apt-get clean autoclean && \
        	apt-get autoremove --yes && \
        	rm -rf /var/lib/{apt,dpkg,cache,log}/

# download and extract kafka 
RUN		mkdir -p ${KAFKA_INSTALL_DIR} && \
		curl -L --silent ${KAFKA_DOWNLOAD_URL} | tar -xz --strip=1 -C ${KAFKA_INSTALL_DIR}


WORKDIR		${KAFKA_INSTALL_DIR}

EXPOSE		9092

COPY		docker-entrypoint.sh ${KAFKA_INSTALL_DIR}/bin/docker-entrypoint.sh

ENTRYPOINT	["bin/docker-entrypoint.sh"]

CMD		["bin/kafka-server-start.sh", "config/server.properties"]	
