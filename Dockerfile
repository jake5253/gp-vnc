FROM gitpod/workspace-full-vnc

USER root

# Install dependencies
RUN apt-get update \
 && apt-get install -y \
 build-essential  \
 libaio-dev \
 libbluetooth-dev \
 libbrlapi-dev \
 libbz2-dev \
 libcap-dev \
 libcap-ng-dev \
 libcurl4-gnutls-dev \
 libgtk-3-dev \
 libibverbs-dev \
 libjpeg8-dev \
 libncurses5-dev \
 libnuma-dev \
 librbd-dev \
 librdmacm-dev \
 libsasl2-dev \
 libsdl1.2-dev \
 libseccomp-dev \
 libsnappy-dev \
 libssh2-1-dev \
 libvde-dev \
 libvdeplug-dev \
 libvte-2.90-dev \
 libxen-dev \
 liblzo2-dev \
 valgrind \
 xfslibs-dev \
 libnfs-dev \
 libiscsi-dev \
 && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

USER gitpod
