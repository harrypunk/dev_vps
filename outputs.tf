output "vpc_id" {
  description = "ID of ecs vpc"
  value       = alicloud_vpc.vpc1.id
}

output "vpc_cidr" {
  description = "vpc cidr"
  value       = alicloud_vpc.vpc1.cidr_block
}

output "fingerprint" {
  description = "fingerprint of key pair"
  value       = one(alicloud_ecs_key_pair.dev_keypair[*].finger_print)
}

output "public_ip" {
  description = "public ip of ecs instance"
  value       = one(alicloud_instance.devinstance1[*].public_ip)
}

output "key_pair_attachment_id" {
  description = "ID of key pair attachment"
  value       = one(alicloud_ecs_key_pair_attachment.dev1_attach[*].id)
}