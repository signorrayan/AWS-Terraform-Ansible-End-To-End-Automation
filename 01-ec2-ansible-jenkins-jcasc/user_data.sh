#!/bin/bash

sudo apt-get update
sudo apt-get install -y python3-pip openjdk-8-jdk git
sudo pip3 install ansible
sudo ansible-galaxy install geerlingguy.jenkins
sleep 5
