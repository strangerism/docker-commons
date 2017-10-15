FROM openjdk:8-jdk

MAINTAINER Massimo Virgilio

RUN apt-get update && apt-get install -y \
 yasm \
 nasm \
 ant \
 python \
 cmake \
 vim-common \
 patch \
 pkg-config \
 git \
 curl \
 unzip \
 libqt5widgets5 \
 aptitude

RUN dpkg --add-architecture i386

RUN aptitude update && aptitude install -y \
 libstdc++6:i386 \
 libgcc1:i386 \
 zlib1g:i386 \
 libncurses5:i386

 RUN apt-get clean

