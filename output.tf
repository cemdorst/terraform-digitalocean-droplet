output "droplet_id" {
  value = {for k, v in digitalocean_droplet.this: k => v.id}
}

output "droplet_ipv4_address" {
  value = {for k, v in digitalocean_droplet.this: k => v.ipv4_address}
}

output "droplet_name" {
  value = {for k, v in digitalocean_droplet.this: k => v.name}
}

output "floating_ip_address" {
  value = {for k, v in digitalocean_floating_ip.this: k => v.ip_address}
}
