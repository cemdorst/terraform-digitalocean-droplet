variable "backups" {
  description = "(Optional) Boolean controlling if backups are made. Defaults to false."
  default     = false
}

variable "block_storage_filesystem_type" {
  description = "(Optional) Initial filesystem type (xfs or ext4) for the block storage volume."
  default     = "xfs"
}

variable "block_storage_size" {
  description = "(Required) The size of the block storage volume in GiB. If updated, can only be expanded."
  default     = 0
}

variable "custom_image" {
  description = "Whether the image is custom or not (an official image)"
  default     = "0"
}

variable "domain_external" {
  description = "Domain name to construct FQDN from (DigitalOcean configures PTR record if zone is hosted by them)"
  default     = ""
}

variable "droplet_count" {
  description = "The number of droplets / other resources to create"
  default     = 1
}

variable "droplet_name" {
  description = "The name of the droplet. If more than one droplet it is appended with the count, examples: stg-web, stg-web-01, stg-web-02"
  type        = "string"
}

variable "droplet_size" {
  description = "the size slug of a droplet size"
  type        = "string"
  default     = "micro"
}

variable "image_id" {
  description = "The id of an image to use"
  default     = ""
}

variable "image_name" {
  description = "The image name or slug to lookup"
  default     = "ubuntu-18-04-x64"
}

variable "ipv6" {
  description = "(Optional) Boolean controlling if IPv6 is enabled. Defaults to false."
  default     = false
}

variable "monitoring" {
  description = "(Optional) Boolean controlling whether monitoring agent is installed. Defaults to false."
  default     = false
}

variable "number_format" {
  description = "The number format used to output."
  default     = "%02d"
}

variable "private_networking" {
  description = "(Optional) Boolean controlling if private networks are enabled. Defaults to false."
  default     = false
}

variable "region" {
  description = "The Digitalocean datacenter to create resources in"
  default     = "ams3"
}

variable "resize_disk" {
  description = "(Optional) Boolean controlling whether to increase the disk size when resizing a Droplet. It defaults to true. When set to false, only the Droplet's RAM and CPU will be resized. Increasing a Droplet's disk size is a permanent change. Increasing only RAM and CPU is reversible."
  default     = "true"
}

variable "sizes" {
  description = "A map of pre-canned instance sizes"
  type        = "map"

  default = {
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

variable "ssh_keys" {
  description = "(Optional) A list of SSH IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use a tool such as curl with the DigitalOcean API, to retrieve them."
  type        = "list"
  default     = []
}

variable "tags" {
  description = "(Optional) A list of the tags to label this Droplet. A tag resource must exist before it can be associated with a Droplet."
  type        = "list"
  default     = []
}

variable "user_data" {
  description = "(Optional) - A string of the desired User Data for the Droplet."
  default     = "true"
}
