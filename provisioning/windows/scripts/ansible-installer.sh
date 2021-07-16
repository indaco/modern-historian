#!/bin/bash

ANSIBLE_BINS_PIP_PATH="${HOME}/.local/bin"

DIR="/home/vagrant/"
HOME_FOLDER=''

if [ -d "$DIR" ]; then
  HOME_FOLDER='/home/vagrant'
else
  HOME_FOLDER='/home/root'
fi

echo ""
echo "* Install Ansible via pip *"
python -m pip install --user ansible

echo ""
echo "* Install jmespath lib via pip *"
pip install jmespath

echo ""
echo "* Moving Ansible bins to /usr/bin *"
sudo cp ${ANSIBLE_BINS_PIP_PATH}/ansible-playbook /usr/bin/ansible-playbook
sudo cp ${ANSIBLE_BINS_PIP_PATH}/ansible-galaxy /usr/bin/ansible-galaxy

echo ""
echo "* Install required Ansible galaxy collections *"
ansible-galaxy collection install -r ${HOME_FOLDER}/ansible/requirements.yml

echo ""
echo "DONE!"