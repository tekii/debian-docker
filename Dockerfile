###
###
###
FROM google/debian:wheezy

MAINTAINER Pablo Jorge Eduardo Rodriguez <pr@tekii.com.ar>

USER root

RUN echo "deb http://http.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list && \
    apt-get update && \
    apt-get dist-upgrade --assume-yes && \
    apt-get install --assume-yes --no-install-recommends ca-certificates && \
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
