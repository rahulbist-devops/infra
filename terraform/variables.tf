variable "cidr_block" {
  description = "Main subnet for the vpc"
}
variable "host-ami" {
  description = "ami id of the instance"
}
variable "key_name_pub" {
  description = "key of the public instance"
}
variable "key_name_priv" {
  description = "key of the private instance"
}

variable "subnet_pub" {
  description = "subnet for public"
}

variable "subnet_priv" {
  description = "subnet for private"
}


variable "instance_type" {
  description = "The instance type"
}


