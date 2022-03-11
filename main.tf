terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.18.0"
    }
  }
}

locals {
  // Map of pre-named sizes to look up from
  sizes = {
    nano      = "s-1vcpu-1gb"
    micro     = "s-2vcpu-2gb"
    small     = "s-2vcpu-4gb"
    medium    = "s-4vcpu-8gb"
    large     = "s-6vcpu-16gb"
    x-large   = "s-8vcpu-32gb"
    xx-large  = "s-16vcpu-64gb"
    xxx-large = "s-24vcpu-128gb"
    maximum   = "s-32vcpu-192gb"
  }
}

// Lookup image to get id
data "digitalocean_image" "official" {
  count = var.custom_image == true ? 0 : 1
  slug  = var.image_name
}

data "digitalocean_image" "custom" {
  count = var.custom_image == true ? 1 : 0
  name  = var.image_name
}

// Create Droplets
resource "digitalocean_droplet" "this" {
  for_each = var.droplet_list

  image = coalesce(var.image_id, element(coalescelist(data.digitalocean_image.custom.*.image, data.digitalocean_image.official.*.image), 0))
  name  = each.key

  region = var.region
  size   = coalesce(local.sizes[var.droplet_size], var.droplet_size)

  // Optional
  backups            = var.backups
  monitoring         = var.monitoring
  ipv6               = var.ipv6
  ssh_keys           = var.ssh_keys
  resize_disk        = var.resize_disk
  tags               = var.tags
  user_data          = var.user_data
}
// Block storage
resource "digitalocean_volume" "volume" {
  for_each = var.droplet_list

  region = var.region
  name   = coalesce(var.block_storage_name, digitalocean_droplet.this[each.key].name)
  size   = var.block_storage_size
  tags               = var.tags

  // Optional
  description              = "Block storage for ${digitalocean_droplet.this[each.key].name}"
  initial_filesystem_label = var.block_storage_filesystem_label
  initial_filesystem_type  = var.block_storage_filesystem_type
}

// Attach volumes
resource "digitalocean_volume_attachment" "volume_attachment" {
  for_each = var.droplet_list

  droplet_id = digitalocean_droplet.this[each.key].id
  volume_id  = digitalocean_volume.volume[each.key].id
}

// Floating IP
resource "digitalocean_floating_ip" "this" {
  for_each = var.droplet_list
  region = var.region
}

// Floating IP assignment
resource "digitalocean_floating_ip_assignment" "this" {
  depends_on = [digitalocean_droplet.this]
  for_each = var.droplet_list

  ip_address = digitalocean_floating_ip.this[each.key].id
  droplet_id = digitalocean_droplet.this[each.key].id
}
