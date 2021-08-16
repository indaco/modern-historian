# Local Provisioning for Windows

The following guide is a step-by-step for Windows users who want to use the demo as VM on their local machine.

Because Windows is a non-POSIX-compliant operating system, there are differences between how Ansible interacts with them and the way Windows works. While these are the base requirements for Ansible connectivity, some Ansible modules have additional requirements, such as a newer OS or PowerShell version.

For those reasons I have decided to use a simplify way to Windows users. Main differences with Linux/OSX users are that a couple of more manual actions (commands) are needed, keeping the entire provisioning almost automated.

## Prerequisites

The following software are needed to setup the environment on your local machine:

- Virtualbox
- Vagrant
- Git (optional)

## How-To

### Step 0 - Open Virtualbox

It is not clear to me but I'm having issue provisioning the VM creation if VirtualBox is not open so, open VirtualBox and no nothing with it.

### Step 1 - Get the source code

First thing to be done is to get the source code for this project from GitHub. If you have git installed on your machine, just do a git clone otherwise go the [project page](https://github.com/indaco/modern-historian) and click "Download"

```bash
git clone https://github.com/indaco/modern-historian.git
```

### Step 2 - Set config data

- Navigate to the `ansible/group_vars` folder
- Create a copy for `template_all.yml` file and save it as `all.yml`
- Leave defaults values

## Step 3 - Start the VM creation

```bash

cd modern-historian/provisioning/windows/local

vagrant up
```

## Step 4 - Complete the setup

Once the provisioning with vagrant finish successfully, login into the machine:

```bash
vagrant ssh
```

Navigate to the `scripts` folder provisioned during the VM creation phase:

```bash
cd scripts
```

Update the system and install the essential packages

```bash
# You are here: /home/root/scripts
bash system-essentials.sh
```

If an upgrade to `openssh-server` exists, the system will ask you how to manage the existing configuration for it

![OpenSSH Server Config Diagram](../../images/sshd_config.png)

Ensure to preserve the existing one selecting `keep the local version currently installed`

Now it is time to install Ansible

```bash
# You are here: /home/root/scripts
bash ansible-installer.sh
```

## Step 5 - Run the Ansible playbook

Once the Ansible installation finish, run the playbook:

```bash
# /home/vagrant/scripts
bash run-playbook.sh
```
