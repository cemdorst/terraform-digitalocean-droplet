// Lookup image to get id
data "digitalocean_image" "default" {
  slug = "${var.image_name}"
}

// Create Droplets
resource "digitalocean_droplet" "droplet" {
  count = "${var.droplet_count}"

  image = "${coalesce(var.image_id, data.digitalocean_image.default.image)}"
  name  = "${var.domain_external != "" ? format("%s-%s.%s", var.droplet_name, format(var.number_format, count.index+1), var.domain_external) : format("%s-%s", var.droplet_name, format(var.number_format, count.index+1))}"

  region = "${var.region}"
  size   = "${coalesce(var.sizes[var.droplet_size], var.droplet_size)}"

  // Optional
  backups            = "${var.backups}"
  monitoring         = "${var.monitoring}"
  ipv6               = "${var.ipv6}"
  private_networking = "${var.private_networking}"
  ssh_keys           = "${var.ssh_keys}"
  resize_disk        = "${var.resize_disk}"
  tags               = ["${var.tags}"]
  user_data          = "${var.user_data}"
}

// Block storage
resource "digitalocean_volume" "volume" {
  count = "${var.block_storage_size > 0 ? var.droplet_count : 0}"

  region = "${var.region}"
  name   = "${format("%s-%s", var.droplet_name, format(var.number_format, count.index+1))}"
  size   = "${var.block_storage_size}"

  // Optional
  description             = "Block storage for ${format("%s-%s", var.droplet_name, format(var.number_format, count.index+1))}"
  initial_filesystem_type = "${var.block_storage_filesystem_type}"
}

// Attach volumes
resource "digitalocean_volume_attachment" "volume_attachment" {
  count = "${var.block_storage_size > 0 ? var.droplet_count : 0}"

  droplet_id = "${element(digitalocean_droplet.droplet.*.id, count.index)}"
  volume_id  = "${element(digitalocean_volume.volume.*.id, count.index)}"
}
