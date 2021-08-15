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

resource "digitalocean_droplet" "modernhistorian" {
  image               = "ubuntu-20-04-x64"
  name                = "modernhistorian"
  region              = var.region
  size                = var.server_size
  private_networking  = true
  ssh_keys            = var.ssh_key_fingerprints

  provisioner "remote-exec" {
    inline        = ["echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=True ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' ${var.ansible_playbook}"
  }
}
