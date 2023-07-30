# Description: Dockerfile for dnsmasq without any extra configuration files
# Author: Andrei Iashchak
# Usage: docker run -d -p 53:53/udp -p 53:53/tcp -v /path/to/dnsmasq.d:/etc/dnsmasq.d --name dnsmasq andreiashchak/docker-dnsmasq
FROM ubuntu:latest
MAINTAINER "Andrei Iashchak <andrei.iashchak@gmail.com>"
RUN apt update && apt install -y dnsmasq
RUN sed -i 's/#conf-dir=\/etc\/dnsmasq.d\/,.*/conf-dir=\/etc\/dnsmasq.d\/,*.conf/' /etc/dnsmasq.conf
VOLUME /etc/dnsmasq.d
EXPOSE 53/udp
EXPOSE 53/tcp
CMD ["dnsmasq", "-k", "-q"]
