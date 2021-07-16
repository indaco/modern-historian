# Local Provisioning for Linux and OSX

## Prerequisites

The following software are needed to setup the environment on your local machine:

- Virtualbox
- Vagrant
- Ansible
- Python >= 3.8
- Pip
- jmespath (via pip) `pip install jmespath`
- Git (optional)

## How-To

### Step 1 - Get the source code

First thing to be done is to get the source code for this project from GitHub. If you have git installed on your machine, just do a git clone otherwise go the [project page](https://github.com/indaco/modern-historian) and click "Download"

```bash
git clone https://github.com/indaco/modern-historian.git
```

### Step 2 - Set config data

- Navigate to the `ansible/group_vars` folder
- Create a copy for `template_all.yml` file and save it as `all.yml`
- Leave defaults values

### Step 3 - Install Ansible galaxy dependencies

Once you have Ansible installed on your local machine, run the following command to install the galaxy collection used by this project

```bash
ansible-galaxy collection install -r ./ansible/requirements.yml
```

### Step 4 - Provisioning the stack

Move into the `provisioning/unix/local` folder and run the provisioning of the VM with Vagrant.

```bash
cd modern-historian/unix/local
vagrant up
```

### Step 5 - Access to apps

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
