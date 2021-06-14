#!/bin/bash

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl


sudo apt-get update && \
sudo apt-get install docker.io -y

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

CHANGE_MINIKUBE_NONE_USER=true
sudo apt-get install -y conntrack
sudo -E minikube start --driver=none
minikube delete
sudo -E minikube start --driver=none

sudo minikube status

