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
