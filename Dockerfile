FROM ubuntu:14.04

MAINTAINER cskkman@gmail.com

RUN sudo apt-get update

RUN apt-get install software-properties-common -y
RUN apt-get install python-software-properties -y
RUN add-apt-repository ppa:jonathonf/python-3.6 -y
RUN apt-get update -y
RUN apt-get install python3.6 -y

# install pip3
RUN apt-get update -y
RUN apt-get install curl -y
RUN apt-get install wget -y
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
# RUN apt-get install python3-pip -y

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jdk



ENV M2_HOME=/usr/lib/mvn

RUN apt-get update && \
  cd /tmp && \
  wget http://www-eu.apache.org/dist/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz && \
  tar xzf apache-maven-3.1.1-bin.tar.gz && \
  mv "apache-maven-3.1.1" "$M2_HOME" && \
  ln -s "$M2_HOME/bin/mvn" /usr/bin/mvn

RUN rm -rf /var/lib/apt/lists/*
