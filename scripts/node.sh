#! /bin/bash

# Name: Kenneth Dzonyrah
# Date 10.04.2023
# Description: Script to install common packages on the worker nodes

/bin/bash /vagrant/configs/join.sh -v

sudo -i -u vagrant bash << EOF
mkdir -p /home/vagrant/.kube
sudo cp -i /vagrant/configs/config /home/vagrant/.kube/
sudo chown 1000:1000 /home/vagrant/.kube/config
NODENAME=$(hostname -s)
kubectl label node $(hostname -s) node-role.kubernetes.io/worker=worker-new
EOF