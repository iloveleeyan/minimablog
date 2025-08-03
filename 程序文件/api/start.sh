#!/bin/sh

# 把 minimablog.cn-api.jar 文件放在这里
cd /data/abc.com/api

java -javaagent:minimablog.cn-api.jar='-pwd 123456' \
-Dspring.config.location=classpath:/,file:application-free.yml \
-Dspring.profiles.active=free -Djava.net.preferIPv4Stack=true \
-Xms128m -Xmx512m -Xss256k \
-XX:SurvivorRatio=8 -XX:NewRatio=3 -XX:+UseSerialGC \
-jar minimablog.cn-api.jar &
