resource "aws_nat_gateway" "nat" {
    allocation_id = "${var.allocation_id}"
    subnet_id = "${var.subnet_id}"
}
resource "aws_eip" "ip" {
  vpc      = true
}


output "natgw-id" {
  value = "${aws_nat_gateway.nat.id}"
}

output "eip_allocation_id" {
  value = "${aws_eip.ip.id}"
}