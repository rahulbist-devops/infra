variable "subnet-name" {
  description = "Name to give the new subnet"
}

variable "vpc-id" {
  description = "ID of the VPC to attach this subnet to"
}

variable "subnet-ip" {
  description = "CIDR block to allocate to this subnet"
}
