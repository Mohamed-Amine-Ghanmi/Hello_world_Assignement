#!/bin/bash -xe

sudo apt install python
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
export PATH=~/.local/bin:$PATH
pip install awscli --upgrade --user
wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
sudo apt install unzip
sudo apt install zip
unzip terraform_0.11.8_linux_amd64.zip
sudo mv terraform /usr/bin
pip install python-lambda-local
