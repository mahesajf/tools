provider "alicloud" {
  access_key = "LTAI5tLCZFh6SGsgpByztRXj"
  secret_key = "HToEWDd6w2Vo6dkg1I1RupXpoUyPGw"
  region     = "ap-southeast-5"
}

variable "passwd" {
  type        = list(string)
  default     = ["JNEd3v0p5", "pass321", "pass213", "pass312"]  # 0, 1, 2, 3, ..
}

# # payment_type
# variable "subscription" {
#   description = "A mapping of fields for Prepaid ECS instances created. "
#   type        = map(string)
#   default = {
#     period             = 2
#     period_unit        = "Month"
#     renewal_status     = "AutoRenewal"
#     auto_renew_period  = 2
#     include_data_disks = true
#   }
# }

resource "alicloud_instance" "cicd" {
    instance_type               = "ecs.c6.large"
    image_id                    = "ubuntu_20_04_x64_20G_alibase_20210128.vhd"
    instance_name               = "devops"
    hostname                    = "root"
    password                    = var.passwd[0]  # [0], [1], [2], [3], ..
    vpc_name                    = "VPC-JNE-DEVOPS"
    cidr_block                  = "172.172.172.0/22"
    vswitch_id                  = "vsw-k1a91pkky5vdbieu1gj5z"
    system_disk_size            = "40"
    # vpc_id                      = "vpc-k1a8u1k4hrc8rar5j98f5"
    # associate_public_ip_address = false # true
    primary_ip_address          =
    internet_charge_type        = "PayByBandwidth" # PayByTraffic
    internet_max_bandwidth_out  = 1
    security_group_id           = "sg-k1abtxzaa4vs46soxo23"
    payment_type                = "PayAsYouGo" # "Subscription"
    # instance_charge_type        = "PrePaid" # Postpaid
    # auto_renew_period           = " " # if Postpaid
}





#   data_disks = [
#     {
#       category = "cloud_efficiency" # cloud_ssd
#       size     = 40
#       delete_with_instance = true
#     }
#   ]