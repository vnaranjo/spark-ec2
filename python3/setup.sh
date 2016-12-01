#!/bin/bash

/root/spark-ec2/copy-dir /root/python3

echo "Installing Python 3..."

pushd /root/spark-ec2/python3 > /dev/null
source ./setup-slave.sh

for node in $SLAVES $OTHER_MASTERS; do
  echo $node
  ssh -t -t $SSH_OPTS root@$node "/root/spark-ec2/python3/setup-slave.sh" & sleep 0.3
done
wait


popd > /dev/null