resource "alicloud_vpc" "default" {
    vpc_name    = "${var.vpc_name}"
    cidr_block  = "172.172.172.0/24"
}

resource "alicloud_vswitch" "default" {
    vpc_name    = "tf_test_vpc"
    cidr_block  = "172.16.0.0/21"
    zone_id     = " "
}

resource "alicloud_security_group" "tf_sg" {
    name    = "tf_sg"
    vpc_id  = alicloud_vpc.tf_test_vpc.id
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
    type              = "ingress"
    ip_protocol       = "tcp"
    policy            = "accept"
    port_range        = "22/22"
    priority          = 1
    security_group_id = alicloud_security_group.tf_sg.id
    cidr_ip           = "0.0.0.0/0"
}

# resource "alicloud_key_pair" "tf_key" {
#     key_name = "tf_key"
#     key_file = " "
# }

