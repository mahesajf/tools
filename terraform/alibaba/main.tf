terraform {
  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.211.2"
    }
  }
}

provider "alicloud" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}" 
}

resource "alicloud_instance" "cicd" {
  instance_type              = "${var.instance_type}"
  image_id                   = "${var.image_id}"
  security_groups            = ["${var.security_groups}"]
  vswitch_id                 = "${var.vswitch_id}"
  internet_max_bandwidth_out = "${var.bandwitdh}"
  instance_name              = "${var.instance_name}"
  hostname                   = "${var.hostname}"
  password                   = "${var.ecs_password}"
  size                       = " "
  payment_type               = "PayAsYouGo" # "Subscription"
}

module "vpc" {
  source = "./vpc"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${module.vpc}"
}

resource "alicloud_vpc" "default" {
    vpc_name    = "${module.vpc.vpc_name}"
    cidr_block  = "${lookup(module.var.cidr_blocks, "az${count.index}")}"
}



