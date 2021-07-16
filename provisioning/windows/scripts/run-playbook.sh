#!/bin/bash

DIR="/home/vagrant/"
HOME_FOLDER=''
LOCAL_ANSIBLE_USER=''

if [ -d "$DIR" ]; then
  HOME_FOLDER='/home/vagrant'
  LOCAL_ANSIBLE_USER='vagrant'
else

  HOME_FOLDER='/home/root'
  LOCAL_ANSIBLE_USER='root'
fi

echo ""
echo "* Moving into the Ansible project folder *"
cd $HOME_FOLDER/ansible/

echo ""
echo "* Run the Ansible playbook *"
ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 --user ${LOCAL_ANSIBLE_USER} playbook.yml