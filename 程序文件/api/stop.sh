#!/bin/sh

JAR=minimablog.cn-api.jar

echo '停止笔记简笔记api后端服务 ...' $JAR

pid=`ps -ef | grep $JAR | grep -v grep | awk '{print $2}'`
if [ -n "$pid" ];then
    sudo kill -15 $pid
    echo sudo kill -15 $pid
    sleep 1
fi

pid=`ps -ef | grep $JAR | grep -v grep | awk '{print $2}'`
if [ -n "$pid" ];then
    sleep 2
    sudo kill -9 $pid
    echo sudo kill -9 $pid
fi
echo -e "\n"

