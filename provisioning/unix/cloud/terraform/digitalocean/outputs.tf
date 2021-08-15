output "Public-IP" {
  value = "${digitalocean_droplet.modern-historian.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.modern-historian.name}"
}
