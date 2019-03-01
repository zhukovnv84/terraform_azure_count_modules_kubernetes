#!/bin/sh
#ssh-keygen -f ~/.ssh/id_rsa -P ""
yum install epel-release -y
yum install epel-release -y
yum  makecache
yum install sshpass git telnet \"Development Tools\" python-pip python-devel telnet  -y
pip install --upgrade pip
pip install ansible

git@github.com:zhukovnv84/ansible_kubernetes_1.13_centos7.git
cd ansible_kubernetes_1.13_centos7
ansible-playbook setup-kubernetes.yml

