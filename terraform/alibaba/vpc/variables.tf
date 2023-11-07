variable "vpc_name" {
  default = "VPC-JNE-DEVOPS"
}

variable "cidr_block" {
  type    = "map"
  default = {
    az0   = "172.0.0.0/24"
    az1   = "172.172.172.0/24"
  }
}


















variable "secret_key" {
  default = "HToEWDd6w2Vo6dkg1I1RupXpoUyPGw"
}

variable "region" {
  default= "ap-southeast-5"
}

variable "instance_type" {
  default = "ecs.t5-lc1m2.small"
}

variable "image_id" {
  default = "ubuntu_20_04_x64_20G_alibase_20210702.vhd"
  {
  }
}

variable "image_id2" {
  default = "centos_20_04_x64_20G_alibase_20210702.vhd"
}

variable "security_groups" {
  default = "sg-xxxxxx"
}

variable "vswitch_id" {
  default = "vsw-xxxxxx"
}

variable "bandwitdh" {
  default = "1"
}

variable "instance_name" {
  default = "example-instance"
}

variable "hostname" {
  default = "example-host"
}

variable "ecs_password" {
  default = "t3std0ng"
}

# variable "security_groups" {
#   default = "sg-xxxxxx"
# }

variable "zone" {
  zone_b = "ap-southeast-5a"
  zone_a = "ap-southeast-5b"
}

variable "zone_b" {
  default = "ap-southeast-5b"
}

variable "ecs_password" {
  default = "t3std0ng"
}

# variable "vpc" {
#   default = "vpc-k1a8u1k4hrc8rar5j98f5" # VPC DevOps
# }