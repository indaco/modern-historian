output "Public-IP" {
  value = "${digitalocean_droplet.modernhistorian.ipv4_address}"
}

output "Name" {
  value = "${digitalocean_droplet.modernhistorian.name}"
}
