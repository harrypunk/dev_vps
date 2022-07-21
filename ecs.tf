resource "alicloud_instance" "devinstance1" {
  count             = var.enable_instance ? 1 : 0
  availability_zone = "cn-hongkong-b"
  security_groups   = alicloud_security_group.secgroup1.*.id

  instance_type              = "ecs.n4.large"
  system_disk_category       = "cloud_efficiency"
  image_id                   = "opensuse_15_4_x64_20G_alibase_20220706.vhd"
  instance_name              = "dev_remote_instance1"
  vswitch_id                 = alicloud_vswitch.vsw.id
  internet_max_bandwidth_out = 10
  /*
   * Alibaba Cloud Linux、CentOS、Ubuntu、SUSE Linux Enterprise、OpenSUSE、Debian
   * https://help.aliyun.com/document_detail/108461.html
   */
  user_data                  = local.setup_data
}

resource "alicloud_ecs_key_pair_attachment" "dev1_attach" {
  count         = var.enable_instance ? 1 : 0
  key_pair_name = alicloud_ecs_key_pair.dev_keypair.key_pair_name
  instance_ids  = alicloud_instance.devinstance1[*].id
}


resource "alicloud_ecs_key_pair" "dev_keypair" {
  key_name_prefix = "dev1_"
  public_key      = var.ssh_pub_key
}

locals {
  setup_data = templatefile("./init.yaml", {
    public_key = var.ssh_pub_key
  })
}
