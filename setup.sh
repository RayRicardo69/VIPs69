#!/bin/bash

clear
echo "Update System"
apt-get update
echo "Installing Python And Pip"
apt-get install -y python-pip python3-pip python3
sleep 3s
echo "SetUp System For All Requirements"
pip3 install proxybroker
chmod +x vips.sh
chmod +x setup.sh
chown root:root vips.sh
cp vips.sh /usr/local/bin/
mv /usr/local/bin/vips.sh /usr/local/bin/vips
echo "SetUp Completed..."
sleep 3s
echo "Running VIPs69"
vips
