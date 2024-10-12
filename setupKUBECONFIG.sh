#!/bin/bash

mkdir -p /var/lib/jenkins/.kube
cp /root/.kube/config /var/lib/jenkins/.kube/config
chown jenkins:jenkins /var/lib/jenkins/.kube/config
echo "Kubeconfig copied and permissions set."
mkdir /mnt/data
echo "created folder for the pv"
chmod 777 /var/run/docker.sock
echo "gave jenkins permission to run docker"
