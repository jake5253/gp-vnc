#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
 build-essential \
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
 libiscsi-dev
 
sudo apt-get clean
sudo rm -rf /var/cache/apt/*
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /tmp/*


cd qemu
git submodule init
git submodule update --recursive
./configure --target-list=x86_64-softmmu,x86_64-linux-user
make -j$(nproc)
sudo make install
