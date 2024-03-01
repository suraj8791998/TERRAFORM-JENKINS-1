#!/bin/bash

set -e

sudo dnf install ansible-core --allowerasing -y


if [ $? -ne 0 ];
then
    echo "INSTALLATION ANSIBLE CORE IS FAILURE"
else
    echo "INSTALLATION ANSIBLE CORE IS SUCCESS"
fi 

cd /tmp
git clone https://github.com/suraj8791998/TERRAFORM-JENKINS-1.git

if [ $? -ne 0 ];
then
    echo "GIT CLONING IS FAILURE"
else
    echo "GIT CLONING IS SUCCESS"
fi 

 cd /tmp/TERRAFORM-JENKINS-1

ansible-playbook jenkins.yaml 
