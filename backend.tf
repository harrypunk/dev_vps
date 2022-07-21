terraform {
  backend "oss" {
    bucket              = "terraform-remote-state-9007"
    prefix              = ""
    key                 = "dev-st01"
    acl                 = "private"
    region              = "cn-hongkong"
    encrypt             = "true"
    tablestore_endpoint = "https://dev-ots01.cn-hongkong.ots.aliyuncs.com"
    tablestore_table    = "dev1_lock"
  }
}
