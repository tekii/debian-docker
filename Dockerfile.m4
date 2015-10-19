###
###
###
FROM google/debian:wheezy

MAINTAINER Pablo Jorge Eduardo Rodriguez <pr@tekii.com.ar>

USER __USER__

COPY *.crt __INSTALL__/

RUN apt-get update && \
    apt-get dist-upgrade --assume-yes && \
    apt-get install --assume-yes --no-install-recommends ca-certificates && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

# the installation of ca-certificates triggers...
#     update-ca-certificates && \