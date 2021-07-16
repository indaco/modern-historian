output "Public-IP" {
  value = "${digitalocean_droplet.industrialedge.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.industrialedge.name}"
}
