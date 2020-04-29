#!/bin/bash

apt-get update
apt-get install haproxy -y

command -v haproxy
if [[ $? != "0" ]]; then
  echo "haproxy was not correctly installed by provision" >&2
  exit 1
fi

echo "ENABLED=1" > /etc/default/haproxy
mv /etc/haproxy/haproxy.cfg{,.original}

cat << _EOF_ > /etc/haproxy/haproxy.cfg
global
    log /dev/log    local0
    log 127.0.0.1   local1 notice
    maxconn 4096
    user haproxy
    group haproxy
    daemon

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    retries 3
    option redispatch
    maxconn 2000
    contimeout     5000
    clitimeout     50000
    srvtimeout     50000

listen webfarm 0.0.0.0:80
    mode http
    stats enable
    stats uri /haproxy?stats
    balance roundrobin
    option httpclose
    option forwardfor
    server web-1 192.168.50.3:80 check
    server web-2 192.168.50.4:80 check
_EOF_

service haproxy start