module "vpc" {
  source = "./modules/vpc"
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames = true
}

module "subnet_pub" {
  source = "./modules/subnet-pub"
  subnet-ip = "${var.subnet_pub}"
  vpc-id = "${module.vpc.vpc-id}"
  subnet-name = "subent_pub"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${module.natgw.natgw-id}"
}

module "subnet_priv" {
  source = "./modules/subnet-priv"
  subnet-ip = "${var.subnet_priv}"
  vpc-id = "${module.vpc.vpc-id}"
  subnet-name = "subent_priv"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${module.vpc.igw-id}"
}

module "natgw" {
  source = "./modules/natgw"
  allocation_id = "${module.natgw.eip_allocation_id}"
  subnet_id = "${module.subnet_priv.subnet-id}"
}

module "security-group-pub" {
  source = "./modules/security-group"
  security-group-name = "SG-pub"
  vpc-id = "${module.vpc.vpc-id}"
  cidr = "${var.cidr_block}"
}

module "security-group-priv" {
  source = "./modules/security-group"
  security-group-name = "SG-priv"
  vpc-id = "${module.vpc.vpc-id}"
  cidr = "${var.cidr_block}"
}

module "instance-pub" {
  source = "./modules/instance"
  host-ami = "${var.host-ami}"
  instance_type = "${var.instance_type}"
  subnet-id = "${module.subnet_pub.subnet-id}"
  instance-name = "public-instance"
  instance-key-name = "${var.key_name_pub}"
  security-groups = ["${module.security-group-pub.security-group-id}"]
  userdata = <<EOF
             #!/bin/bash
             sudo add-apt-repository ppa:webupd8team/java -y
             sudo apt install oracle-java8-installer -y
             wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
             sudo apt-add-repository "deb https://pkg.jenkins.io/debian-stable binary/"
             sudo apt install jenkins -y
             sudo apt-get install ansible -y
             EOF
  associate-public-ip-address = true
}

module "instance-priv" {
  source = "./modules/instance"
  host-ami = "${var.host-ami}"
  instance_type = "${var.instance_type}"
  subnet-id = "${module.subnet_priv.subnet-id}"
  instance-name = "private-instance"
  instance-key-name = "${var.key_name_priv}"
  security-groups = ["${module.security-group-priv.security-group-id}"]
  associate-public-ip-address = true
}



