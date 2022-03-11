# terraform-digitalocean-droplet
Terraform module which creates Droplet(s) and optionally, Block Storage Volumes,
and Floating IPs

These types of resources are used:
* [DigitalOcean Droplet](https://www.terraform.io/docs/providers/do/r/droplet.html)
* [DigitalOcean DNS record](https://www.terraform.io/docs/providers/do/r/record.html)
* [DigitalOcean Image](https://www.terraform.io/docs/providers/do/d/image.html)
* [DigitalOcean Volume](https://www.terraform.io/docs/providers/do/r/volume.html)
* [DigitalOcean Volume Attachment](https://www.terraform.io/docs/providers/do/r/volume_attachment.html)
* [DigitalOcean Floating IP](https://www.terraform.io/docs/providers/do/r/floating_ip.html)
* [DigitalOcean Floating IP Assignment](https://www.terraform.io/docs/providers/do/r/floating_ip_assignment.html)
* [DigitalOcean Load Balancer](https://www.terraform.io/docs/providers/do/r/loadbalancer.html)
* [DigitalOcean Tag](https://www.terraform.io/docs/providers/do/r/tag.html)

## Usage Examples
Some examples can be found in this repository:
* [Simple](https://github.com/terraform-digitalocean-modules/terraform-digitalocean-droplet/tree/master/examples/simple)
* [Load Balancer](https://github.com/terraform-digitalocean-modules/terraform-digitalocean-droplet/tree/master/examples/loadbalancer)
* [DNS](https://github.com/terraform-digitalocean-modules/terraform-digitalocean-droplet/tree/master/examples/dns)

**Note** that examples may create resources which can cost money.
Run `terraform destroy` when you don't need these resources.

If you're looking to try Digitalocean out, [sign up here](https://m.do.co/c/485f1b80f8dc)
and get $100 free credit.

## Droplet Sizes
A map of name to Droplet sizes exists to make specifying Droplet sizes simpler:

| Name      | Droplet Size   |
| --------- | -------------- |
| nano      | s-1vcpu-1gb    |
| micro     | s-2vcpu-2gb    |
| small     | s-2vcpu-4gb    |
| medium    | s-4vcpu-8gb    |
| large     | s-6vcpu-16gb   |
| x-large   | s-8vcpu-32gb   |
| xx-large  | s-16vcpu-64gb  |
| xxx-large | s-24vcpu-128gb |
| maximum   | s-32vcpu-192gb |

See [DigitalOcean Pricing](https://www.digitalocean.com/pricing/) for costs.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| digitalocean | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| backups | (Optional) Boolean controlling if backups are made. Defaults to false. | `bool` | `false` | no |
| block\_storage\_attach | (Optional) Whether to attach the volume using Terraform or not. | `bool` | `true` | no |
| block\_storage\_count | (Optional) A count of block storage volume resources to create. | `string` | `""` | no |
| block\_storage\_filesystem\_label | (Optional) Initial filesystem label for the block storage volume. | `string` | `"data"` | no |
| block\_storage\_filesystem\_type | (Optional) Initial filesystem type (xfs or ext4) for the block storage volume. | `string` | `"xfs"` | no |
| block\_storage\_name | (Optional) Override filesystem name for the block storage volume. | `string` | `""` | no |
| block\_storage\_size | (Required) The size of the block storage volume in GiB. If updated, can only be expanded. | `number` | `0` | no |
| custom\_image | Whether the image is custom or not (an official image) | `bool` | `false` | no |
| droplet\_count | The number of droplets / other resources to create | `number` | `1` | no |
| droplet\_name | The name of the droplet. If more than one droplet it is appended with the count, examples: stg-web, stg-web-01, stg-web-02 | `any` | n/a | yes |
| droplet\_size | the size slug of a droplet size | `string` | `"micro"` | no |
| floating\_ip | (Optional) Boolean to control whether floating IPs should be created. | `bool` | `false` | no |
| floating\_ip\_assign | (Optional) Boolean controlling whether floatin IPs should be assigned to instances with Terraform. | `bool` | `true` | no |
| floating\_ip\_count | Number of floating IPs to create. | `string` | `""` | no |
| image\_id | The id of an image to use. | `string` | `""` | no |
| image\_name | The image name or slug to lookup. | `string` | `"ubuntu-18-04-x64"` | no |
| ipv6 | (Optional) Boolean controlling if IPv6 is enabled. Defaults to false. | `bool` | `false` | no |
| monitoring | (Optional) Boolean controlling whether monitoring agent is installed. Defaults to false. | `bool` | `false` | no |
| region | The Digitalocean datacenter to create resources in. | `string` | `"ams3"` | no |
| resize\_disk | (Optional) Boolean controlling whether to increase the disk size when resizing a Droplet. It defaults to true. When set to false, only the Droplet's RAM and CPU will be resized. Increasing a Droplet's disk size is a permanent change. Increasing only RAM and CPU is reversible. | `bool` | `true` | no |
| tags | (Optional) A list of the tags to label this Droplet. A tag resource must exist before it can be associated with a Droplet. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| droplet\_id | List of IDs of Droplets |
| floating\_ip\_address | List of floating IP addresses created |
| ipv4\_address | List of public IPv4 addresses assigned to the Droplets |
| name | List of names of Droplets |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
