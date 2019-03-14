variable "security-group-name" {
  description = "Name to use for the Name tag"
}

variable "vpc-id" {
  description = "ID of the VPC to create the security group in"
}

variable "cidr" {
  description = "cidr range to be whitelisted"
}
