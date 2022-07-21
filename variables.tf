variable "vpc_name" {
  description = "Name of ecs vpc"
  type        = string
  default     = "dev_vpc1"
}

variable "enable_instance" {
  description = "enable ecs instance"
  type        = bool
  default     = false
}

variable "ssh_pub_key" {
  description = "ssh public key"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJOx2oCRcuzSowLfQH2qY91vgRCuJfEoNG9+Qjr8G+PN mdev1"
}
