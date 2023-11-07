# 0. Provider information

provider "alicloud" {
  access_key = "LTAI5tLCZFh6SGsgpByztRXj"
  secret_key = "HToEWDd6w2Vo6dkg1I1RupXpoUyPGw"
  region     = "ap-southeast-5"
}

# 1. Create VPC

# resource "alicloud_vpc" "VPC-JNE-DEVOPS" {
#   vpc_name   = "VPC-JNE-DEVOPS"
#   cidr_block = "172.172.172.0/22"
# }
# vpc-k1a8u1k4hrc8rar5j98f5

# 2. Create a vSwitch  

# resource "alicloud_vswitch" "tf_vSwitch" {
#   vpc_id            = alicloud_vpc.tf_test_vpc.id
#   cidr_block        = "172.16.0.0/21"
#   zone_id           = "ap-south-1a"
# }

# # 3. Create Security Group to allow port 22, 80 and 443

# resource "alicloud_security_group" "tf_sg" {
#   name   = "tf_sg"
#   vpc_id = alicloud_vpc.tf_test_vpc.id
# }

# resource "alicloud_security_group_rule" "allow_all_tcp" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "22/22"
#   priority          = 1
#   security_group_id = alicloud_security_group.tf_sg.id
#   cidr_ip           = "0.0.0.0/0"
# }

# resource "alicloud_security_group_rule" "allow_all_http" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "80/80"
#   priority          = 1
#   security_group_id = alicloud_security_group.tf_sg.id
#   cidr_ip           = "0.0.0.0/0"
# }

# resource "alicloud_security_group_rule" "allow_all_https" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "443/443"
#   priority          = 1
#   security_group_id = alicloud_security_group.tf_sg.id
#   cidr_ip           = "0.0.0.0/0"
# }

# resource "alicloud_security_group_rule" "icmp_in" {
#   type              = "ingress"
#   ip_protocol       = "icmp"
#   policy            = "accept"
#   port_range        = "-1/-1"
#   priority          = 1
#   security_group_id = alicloud_security_group.tf_sg.id
#   cidr_ip           = "0.0.0.0/0"
# }

# # 4. Create a key pair 

# resource "alicloud_key_pair" "tf_key" {
#   key_name = "tf_key"
#   key_file = "tf_key.pem"
# }

# 5. Create Ubuntu server and install Apache in it

resource "alicloud_instance" "cicd" {
    instance_type               = "ecs.c6.large"
    image_id                    = "ubuntu_20_04_x64_20G_alibase_20210128.vhd"
    instance_name               = " "
    hostname                    = " "
    password                    = " "
    vpc_name                    = "VPC-JNE-DEVOPS"
    cidr_block                  = "172.172.172.0/22"
    vswitch_id                  = "vsw-k1a91pkky5vdbieu1gj5z"
    system_disk_size            = "20"
    # vpc_id                      = "vpc-k1a8u1k4hrc8rar5j98f5"
    internet_charge_type        = "PayByBandwidth" # PayByTraffic
    internet_max_bandwidth_out  = 1
    security_group_id           = "sg-k1abtxzaa4vs46soxo23"
    payment_type                = "PayAsYouGo" # "Subscription"
    # instance_charge_type        = "PrePaid" # Postpaid
    # auto_renew_period           = " " # if Postpaid
}

#   data_disks = [
#     {
#       category = "cloud_efficiency"
#       size     = 40
#       delete_with_instance = true
#     }
#   ]

# 6. Create a network interface with an IP in the subnet and attach it to the instance

# resource "alicloud_network_interface" "tf_nic" {
#   name              = "tf_nic"
#   vswitch_id        = alicloud_vswitch.tf_vSwitch.id
#   security_groups   = alicloud_security_group.tf_sg.*.id
#   private_ip        = "172.16.0.20"
#   private_ips_count = 3
# }

# resource "alicloud_network_interface_attachment" "tf_nic_attachment" {
#   instance_id          = alicloud_instance.instance_tf_01.id
#   network_interface_id = alicloud_network_interface.tf_nic.id
# }

# # 7. Create an elastic IP and associate it with the instance

# resource "alicloud_eip" "eip" {
#   name = "tf_eip"
#   internet_charge_type = "PayByTraffic"
# }

# resource "alicloud_eip_association" "eip_asso" {
#   allocation_id = alicloud_eip.eip.id
#   instance_id   = alicloud_instance.instance_tf_01.id
# }

# # 8. SSH into the server and check the connectivity

