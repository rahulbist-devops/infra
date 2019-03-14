resource "aws_subnet" "subnet" {
  vpc_id = "${var.vpc-id}"
  cidr_block = "${var.subnet-ip}"
  tags {
    Name = "${var.subnet-name}"
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = "${var.vpc-id}"
}

output "route-table-id" {
  value = "${aws_route_table.route-table.id}"
}

resource "aws_route" "route" {
  route_table_id = "${aws_route_table.route-table.id}"
  destination_cidr_block = "${var.destination_cidr_block}"
  gateway_id = "${var.gateway_id}"
}

resource "aws_route_table_association" "assoc" {
  subnet_id = "${aws_subnet.subnet.id}"
  route_table_id = "${aws_route_table.route-table.id}"
}
output "subnet-id" {
 value = "${aws_subnet.subnet.id}"
}

output "route-id" {
  value = "${aws_route.route.id}"
}
