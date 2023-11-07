terraform {
  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.211.2"
    }
  }
}

provider "alicloud" {
  access_key = "LTAI5tLCZFh6SGsgpByztRXj"
  secret_key = "HToEWDd6w2Vo6dkg1I1RupXpoUyPGw"
  region     = "ap-southeast-5" 
}

resource "alicloud_instance" "instance" {
    instance_type               = "ecs.t5-lc1m1.small"
    image_id                    = "ubuntu_20_04_x64_20G_alibase_20210128.vhd"
    instance_name               = "devops2"
    host_name                   = "root"
    password                    = "JNEd3v0p5"
    # vpc_name                    = "VPC-JNE-DEVOPS"
    # cidr_block                  = "172.172.172.0/22"
    vswitch_id                  = "vsw-k1a91pkky5vdbieu1gj5z"
    system_disk_size            = "20"
    # vpc_id                      = "vpc-k1a8u1k4hrc8rar5j98f5"
    internet_charge_type        = "PayByBandwidth" # PayByTraffic
    internet_max_bandwidth_out  = 1
    security_groups             = ["sg-k1abtxzaa4vs46soxo23"]
    # payment_type                = "PayAsYouGo" # "Subscription"
    instance_charge_type        = "PostPaid" # Postpaid / Prepaid
    # auto_renew_period           = " " # if Postpaid
}