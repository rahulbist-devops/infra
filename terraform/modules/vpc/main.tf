resource "aws_vpc" "vpc" {
    cidr_block = "${var.cidr_block}"
    enable_dns_hostnames = "${var.enable_dns_hostnames}"
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vpc.id}"

}

output "vpc-id" {
  value = "${aws_vpc.vpc.id}"
}

output "igw-id" {
  value = "${aws_internet_gateway.igw.id}"
}

output "enable_dns_hostnames" {
  value = "${aws_vpc.vpc.enable_dns_hostnames}"
}
