FROM ubuntu:latest
RUN apt update && apt install -y dnsmasq
CMD dnsmasq -k
