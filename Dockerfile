FROM phusion/baseimage:latest

MAINTAINER csutcliff

VOLUME ["/config"]

RUN export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
apt-get install -y \
wget \
oracle-java9-installer \
oracle-java9-set-default \
wakeonlan && \
usermod -u 99 nobody && \
usermod -g 100 nobody && \
mkdir -p /etc/my_init.d

COPY firstrun.sh /etc/my_init.d/firstrun.sh

RUN chmod +x /etc/my_init.d/firstrun.sh
