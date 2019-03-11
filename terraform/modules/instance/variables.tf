variable "host-ami" {
  description = "AMI to use for this instance, defaults to basic ubuntu 16.04."
  default = "ami-fdb69eea"
}

variable "instance_type" {
  description = "The EC2 instance type to use for this host, defaults to t2.nano."
}

variable "subnet-id" {
  description = "The id of the subnet this host should be placed in."
}

variable "instance-key-name" {
  description = "The EC2 key to use for this instance, be sure that you have this key available because you will need it for SSH access."
}

variable "instance-name" {
  description = "Human readable name for this instance, will be placed in the Name tag."
}

variable "security-groups" {
  description = "Comma separated list of ids representing the security groups to apply to this instance."
  type = "list"
}

variable "associate-public-ip-address" {
  description = "Whether or not to associate a public ip address to this instance, defaults to true."
}

variable "userdata" {
  description = "If set, adds userdata to the instance."
  default = ""
}


