FROM centos:7
MAINTAINER Michael_ai

USER root

# install dev tools
RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y curl which tar sudo openssh-server openssh-clients rsync
RUN yum update -y libselinux

# java
#RUN curl -LO 'https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
add jdk-8u202-linux-x64.rpm .
RUN rpm -i jdk-8u202-linux-x64.rpm
RUN rm jdk-8u202-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin

#passwordless ssh
RUN mkdir  /var/run/sshd/
RUN ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t ecdsa -P '' -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t ed25519 -P '' -f /etc/ssh/ssh_host_ed25519_key

RUN echo -e "StrictHostKeyChecking no\nUserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys

#hadoop
add hadoop-2.8.5.tar.gz /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.8.5 hadoop

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

ENV PATH $PATH:$HADOOP_HOME/bin
ENV PATH $PATH:$HADOOP_HOME/sbin

add core-site.xml $HADOOP_HOME/etc/hadoop/
add hdfs-site.xml $HADOOP_HOME/etc/hadoop/
add mapred-site.xml $HADOOP_HOME/etc/hadoop/
add yarn-site.xml $HADOOP_HOME/etc/hadoop/
add hadoop-env.sh $HADOOP_HOME/etc/hadoop/
ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]


# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122   






