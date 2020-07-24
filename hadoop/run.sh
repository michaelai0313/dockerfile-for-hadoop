#!/bin/bash
/usr/sbin/sshd -D &
hdfs namenode -format
start-dfs.sh
start-yarn.sh
tail -f /dev/null
