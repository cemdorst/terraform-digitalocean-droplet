variable "private_networking" {
  description = "Private networking?"
  type        = bool
  default     = true
}

variable "monitoring" {
  description = "Monitoring?"
  type        = bool
  default     = false
}

variable "region" {
  description = "Default Region"
  type        = string
  default     = "nyc3"
}

variable "backups" {
  description = "(Optional) Boolean controlling if backups are made. Defaults to false."
  default     = false
}

variable "block_storage_attach" {
  description = "(Optional) Whether to attach the volume using Terraform or not."
  default     = true
}

variable "block_storage_count" {
  description = "(Optional) A count of block storage volume resources to create."
  default     = ""
}

variable "block_storage_filesystem_label" {
  description = "(Optional) Initial filesystem label for the block storage volume."
  default     = "data"
}

variable "block_storage_filesystem_type" {
  description = "(Optional) Initial filesystem type (xfs or ext4) for the block storage volume."
  default     = "xfs"
}

variable "block_storage_name" {
  description = "(Optional) Override filesystem name for the block storage volume."
  default     = ""
}

variable "block_storage_size" {
  description = "(Required) The size of the block storage volume in GiB. If updated, can only be expanded."
  default     = 5
}

variable "custom_image" {
  description = "Whether the image is custom or not (an official image)"
  default     = false
}

variable "droplet_list" {
  description = "List of droplets/other resources to create"
  nullable = false
  default = []
}

variable "droplet_size" {
  description = "the size slug of a droplet size"
  default     = "micro"
}

variable "floating_ip" {
  description = "(Optional) Boolean to control whether floating IPs should be created."
  default     = false
}

variable "floating_ip_assign" {
  description = "(Optional) Boolean controlling whether floatin IPs should be assigned to instances with Terraform."
  default     = true
}

variable "floating_ip_count" {
  description = "Number of floating IPs to create."
  default     = ""
}

variable "image_id" {
  description = "The id of an image to use."
  default     = ""
}

variable "image_name" {
  description = "The image name or slug to lookup."
  default     = "ubuntu-18-04-x64"
}

variable "ipv6" {
  description = "(Optional) Boolean controlling if IPv6 is enabled. Defaults to false."
  default     = false
}

variable "resize_disk" {
  description = "(Optional) Boolean controlling whether to increase the disk size when resizing a Droplet. It defaults to true. When set to false, only the Droplet's RAM and CPU will be resized. Increasing a Droplet's disk size is a permanent change. Increasing only RAM and CPU is reversible."
  default     = true
}

variable "ssh_keys" {
  description = "(Optional) A list of SSH IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use a tool such as curl with the DigitalOcean API, to retrieve them."
  default     = []
}

variable "tags" {
  description = "(Optional) A list of the tags to label this Droplet. A tag resource must exist before it can be associated with a Droplet."
  default     = []
}

variable "user_data" {
  description = "(Optional) A string of the desired User Data for the Droplet."
  default     = "exit 0"
}
