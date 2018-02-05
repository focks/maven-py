FROM ubuntu:14.04

MAINTAINER cskkman@gmail.com

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# install pip3
RUN apt-get update -y
RUN apt-get install python3-pip -y

RUN sudo apt-get update

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jdk

RUN apt-get install maven -y

RUN rm -rf /var/lib/apt/lists/*
