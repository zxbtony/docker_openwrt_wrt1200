FROM ubuntu
MAINTAINER Tony Zhang <tony.zhang@outlook.com>
RUN apt-get update && apt-get install -y build-essential ccache curl dnsutils flex gawk gettext git liblzma-dev libncurses5-dev libssl-dev python subversion u-boot-tools unzip wget xsltproc zlib1g-dev

RUN mkdir -p /openwrt/ && \
    wget https://downloads.openwrt.org/chaos_calmer/15.05.1/mvebu/generic/OpenWrt-SDK-15.05.1-mvebu_gcc-4.8-linaro_uClibc-0.9.33.2_eabi.Linux-x86_64.tar.bz2 && \
    mv /OpenWrt-SDK-15.05.1-mvebu_gcc-4.8-linaro_uClibc-0.9.33.2_eabi.Linux-x86_64.tar.bz2 /openwrt/openwrt.tar.bz2 && \
    cd /openwrt/ && \
    tar -xjvf openwrt.tar.bz2 && \
    cd /openwrt/OpenWrt-SDK-15.05.1-mvebu_gcc-4.8-linaro_uClibc-0.9.33.2_eabi.Linux-x86_64/ && \
    make defconfig && \
    ./scripts/feeds update packages && \
    ./scripts/feeds install -a -p packages

WORKDIR /root/openwrt/OpenWrt-SDK-15.05.1-mvebu_gcc-4.8-linaro_uClibc-0.9.33.2_eabi.Linux-x86_64/
