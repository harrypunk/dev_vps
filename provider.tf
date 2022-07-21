terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.176.0"
    }
  }
}

provider "alicloud" {
}