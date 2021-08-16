terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "modern-historian" {
  image               = "ubuntu-20-04-x64"
  name                = "modern-historian"
  region              = var.region
  size                = var.server_size
  private_networking  = true
  ssh_keys            = var.ssh_key_fingerprints

  connection {
    host        = self.ipv4_address
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt -qq update",
      "sudo apt -qq install --yes apt-transport-https",
      "sudo apt -qq install --yes ca-certificates",
      "sudo apt -qq install --yes build-essentials",
      "sudo apt -qq install --yes software-properties-common",
      "sudo ln -s /usr/bin/python3 /usr/bin/python",
      "sudo apt -qq update",
      "sudo apt -qq install --yes python3-pip",
      "sudo mkdir -p /home/root/ansible",
      "sudo mkdir -p /home/root/scripts",
      "echo Done!"
    ]
  }

  # Copy the ansible project folder to /home/root/ansible
  provisioner "file" {
    source      = var.ansible_folder
    destination = "/home/root/ansible"
  }

  # Copy the scripts folder to /home/root/scripts
  provisioner "file" {
    source      = var.scripts_folder
    destination = "/home/root/scripts"
  }
}
