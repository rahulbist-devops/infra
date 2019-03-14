variable "subnet-name" {
  description = "Name to give the new subnet"
}

variable "vpc-id" {
  description = "ID of the VPC to attach this subnet to"
}

variable "subnet-ip" {
  description = "CIDR block to allocate to this subnet"
}
variable "destination_cidr_block" {
  description = "destination_cidr_block"
}

variable "nat_gateway_id" {
  description = "nat_gateway_id"
}

