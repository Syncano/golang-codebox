#!/bin/bash

if [ $1 != "--partial" ]
then
    docker build -t quay.io/syncano/golang-codebox .
fi

docker run -d -p 2200:22 --env-file image/environment --name ansible quay.io/syncano/golang-codebox dumb-init /usr/sbin/sshd -D
ansible-playbook -i "`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ansible`," -u root --private-key image/id_rsa provision-golang-codebox.yml
docker commit ansible quay.io/syncano/golang-codebox

docker run -d --env-file image/environment -u syncano --name golang quay.io/syncano/golang-codebox dumb-init /usr/sbin/sshd -D
docker commit golang quay.io/syncano/golang-codebox
