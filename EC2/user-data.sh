#!/bin/bash

# install git, node and yarn
apt update -y
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
sudo apt-get install -y nodejs git
# For testing reasons
#sudo apt-get install -y mysql-client
sudo npm install --global yarn
# clone backend subdir of repo
cd /home/ubuntu
git clone --depth 1 --filter=blob:none https://github.com/brunopecampos/AWS-Practical.git --sparse 
cd AWS-Practical 
git config --global --add safe.directory $PWD
git sparse-checkout init --cone
git sparse-checkout set ./EC2/backend
# install dependencies and start server
cd ./EC2/backend
yarn install
echo opus-database-test.ca9hkxflswkm.us-west-1.rds.amazonaws.com > db_endpoint
node server.js