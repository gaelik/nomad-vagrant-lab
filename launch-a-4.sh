#!/bin/bash

cd $HOME

# Form Consul Cluster
ps -C consul
retval=$?
if [ $retval -eq 0 ]; then
  sudo killall consul
fi
sudo cp /vagrant/consul-config/consul-client-east.hcl /etc/consul.d/consul-client-east.hcl
sudo nohup consul agent --config-file /etc/consul.d/consul-client-east.hcl &>$HOME/consul.log &

# Form Nomad Cluster
ps -C nomad
retval=$?
if [ $retval -eq 0 ]; then
  sudo killall nomad
fi
sudo cp /vagrant/nomad-config/nomad-client-east.hcl /etc/nomad.d/nomad-client-east.hcl
sudo nohup nomad agent -config /etc/nomad.d/nomad-client-east.hcl &>$HOME/nomad.log &
