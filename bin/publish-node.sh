#!/bin/bash -le

echo "Starting discover for rabbitmq nodes"

ETCDCTL="etcdctl --peers $ETCD_URL"
PUBLISH_NODE_TTL=${PUBLISH_NODE_TTL:-120}
PUBLISH_NODE_POLL=${PUBLISH_NODE_POLL:-60s}
NODE=$(cat /var/lib/rabbitmq/nodename)
HOST_IP=$(ip addr | grep eth0 | grep inet | awk '{print $2}' | awk -F / '{print $1}')

sleep 2
${ETCDCTL} set --ttl 120 /rabbitmq/nodes/${NODE} ${HOST_IP}
