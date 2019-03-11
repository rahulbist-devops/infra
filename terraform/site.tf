module "vpc" {
  source = "./modules/vpc"
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames = true
}

module "subnet_pub" {
  source = "./modules/subnet"
  subnet-ip = "${var.subnet_pub}"
  vpc-id = "${module.vpc.vpc-id}"
  subnet-name = "subent_pub"
}

module "subnet_priv" {
  source = "./modules/subnet"
  subnet-ip = "${var.subnet_priv}"
  vpc-id = "${module.vpc.vpc-id}"
  subnet-name = "subent_priv"
}

module "natgw" {
  source = "./modules/natgw"
  allocation_id = "${module.natgw.eip_allocation_id}"
  subnet_id = "${module.subnet_pub.subnet-id}"
}

module "security-group-pub" {
  source = "./modules/security-group"
  security-group-name = "SG-pub"
  vpc-id = "${module.vpc.vpc-id}"
}

module "security-group-priv" {
  source = "./modules/security-group"
  security-group-name = "SG-priv"
  vpc-id = "${module.vpc.vpc-id}"
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
             #! /bin/bash
             wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
             echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list   
             sudo apt-get update
             sudo apt-get install jenkins
             sudo systemctl start jenkins
             sudo apt-get install python -y
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
  associate-public-ip-address = false
}



