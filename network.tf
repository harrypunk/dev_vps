resource "alicloud_vpc" "vpc1" {
  vpc_name   = var.vpc_name
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw" {
  vpc_id     = alicloud_vpc.vpc1.id
  cidr_block = "172.16.0.0/21"
  zone_id    = "cn-hongkong-b"
}

resource "alicloud_security_group" "secgroup1" {
  name   = "dev_securitygroup"
  vpc_id = alicloud_vpc.vpc1.id
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.secgroup1.id
  cidr_ip           = "0.0.0.0/0"
}

