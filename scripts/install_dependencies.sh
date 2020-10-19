#!/usr/bin/env bash

if ! command -v node &> /dev/null
then
    echo "node could not be found, installing ..."
    sudo amazon-linux-extras install epel
    sudo yum install nodejs -y
    sudo npm install -g yarn
    exit
fi

sudo yum install httpd -y
