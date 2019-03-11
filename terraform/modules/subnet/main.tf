resource "aws_subnet" "subnet" {
  vpc_id = "${var.vpc-id}"
  cidr_block = "${var.subnet-ip}"
  tags {
    Name = "${var.subnet-name}"
  }
}
output "subnet-id" {
  value = "${aws_subnet.subnet.id}"
}
