FROM vladus2000/ubuntu-base
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /

RUN \
	apt-get update && \
	apt-get -y dist-upgrade && \
	apt-get -y install gnupg wget && \
	echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" > /etc/apt/sources.list.d/resilio-sync.list && \
	wget -qO - https://linux-packages.resilio.com/resilio-sync/key.asc | apt-key add - && \
	apt-get update && \
	apt-get -y install resilio-sync && \
	apt-get -y purge gnupg wget && \
	apt-get -y autoremove && \
	apt-get clean && \
	mkdir config && \
	mkdir .sync && \
	chmod ugo+rwx config .sync && \
	chmod +x /startup.sh

CMD /bin/bash -c /startup.sh

VOLUME /config
VOLUME /.sync

EXPOSE 8888
EXPOSE 55555

