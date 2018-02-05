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
RUN curl https://bootstrap.pypa.io/get-pip.py | sudo python3.6
# RUN apt-get install python3-pip -y

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jdk

RUN apt-get install maven -y

RUN rm -rf /var/lib/apt/lists/*

RUN echo "alias python=python3.6" >> ~/.bashrc
RUN echo "alias python3=python3.6" >> ~/.bashrc
RUN echo "alias pip=pip3" >> ~/.bashrc

CMD ["source", "~/.bashrc"]
