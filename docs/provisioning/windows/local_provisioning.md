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

Now it is time to install Ansible:

```bash
# You are here: /home/vagrant/scripts
bash ansible-installer.sh
```

### Step 5 - Install Ansible galaxy dependencies

Once you have Ansible installed on your local machine, run the following command to install the galaxy collection used by the project

```bash
# You are here: /home/vagrant
ansible-galaxy collection install -r ./ansible/requirements.yml
```

## Step 6 - Run the Ansible playbook

Once the Ansible installation finish, run the playbook:

```bash
# /home/vagrant/scripts
bash run-playbook.sh
```

### Step 7 - Access to apps

During the provisioning step, several configurations are applied in order to automate and simplify the setup. Below is a quick summary of what you get out of the box:

- **InfluxDB v2**:
  - tokens for telegraf and Grafana created
  - bucket created
  - task to calculate prussures differences
- **Telegraf**:
  - configuration to read data from the OPC UA Server
  - configuration to write data into InfluxDB's bucket
- **Grafana**:
  - datasource configuraion
  - demo dashboard

In order to get access to the services please, refer to the below table:

| Service     |          URL          | Username |                                Password |
| ----------- | :-------------------: | -------: | --------------------------------------: |
| InfluxDB v2 | http://localhost:8086 | demouser |                        demouserpassword |
| Grafana     | http://localhost:3000 |    admin | admin (change it after the first login) |
| Portainer   | http://localhost:9000 |    admin |             (set it at the first login) |

To get access to the OPC UA Server, you can use any OPC UA client, e.g. [Prosys](https://downloads.prosysopc.com/opc-ua-client-downloads.php)

As url, use the following `opc.tcp://localhost:4334/UA/DemoOPCUAServer`
