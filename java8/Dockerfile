FROM centos:7
MAINTAINER Michael_ai

USER root

# install dev tools
RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y curl which tar sudo openssh-server openssh-clients rsync
RUN yum update -y libselinux

# java
RUN curl -LO 'https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-8u202-linux-x64.rpm
RUN rm jdk-8u202-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin
