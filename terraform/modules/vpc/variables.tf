variable "cidr_block" {
  description = "Main subnet for the vpc"
}

variable "enable_dns_hostnames" {
  description = "do you want to enable dns hostnames (true/false)"
  default = false
}
