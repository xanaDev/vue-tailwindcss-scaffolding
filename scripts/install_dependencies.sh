#!/usr/bin/env bash

install_service() {
  serviceName=$1

  if systemctl --all --type service | grep -q "$serviceName";then
      echo "$serviceName exists."
  else
      echo "$serviceName does NOT exist."
      sudo yum install httpd -y
  fi
}

install_process() {
  process=$1
  if ! command -v $process &> /dev/null
  then
      echo "node could not be found, installing ..."
      sudo amazon-linux-extras install epel
      sudo yum install nodejs -y
      sudo npm install -g yarn
      exit
  fi
}


install_service "httpd"

install_process "node"
