#!/bin/bash

echo ""
echo "* Run apt update *"
sudo apt update --yes
echo ""
echo "* Run apt upgrade *"
sudo apt upgrade --yes
echo ""
echo "* Install essentials packages *"
sudo apt install --yes apt-transport-https ca-certificates software-properties-common curl gnupg2 lsb-release
echo ""
echo "* Create symlink for python3 *"
sudo ln -s /usr/bin/python3 /usr/bin/python
echo ""
echo "* Run apt update *"
sudo apt update --yes
echo ""
echo "* Install Python3 PIP *"
sudo apt install --yes python3-pip
echo Done!
