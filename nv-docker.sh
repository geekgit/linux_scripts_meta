#!/bin/bash
cd /root
sudo wget --secure-protocol=TLSv1_2 --https-only "https://nvidia.github.io/nvidia-docker/gpgkey" -O nv-gpgkey
sudo apt-key add nv-gpgkey
cd /etc/apt/sources.list.d/
sudo wget --secure-protocol=TLSv1_2 --https-only "https://nvidia.github.io/nvidia-docker/ubuntu18.04/nvidia-docker.list"
sudo apt-get update
sudo apt-get install -y nvidia-docker2
