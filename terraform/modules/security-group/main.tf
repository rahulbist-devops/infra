resource "aws_security_group" "security-group" {
  name = "${var.security-group-name}"
  vpc_id = "${var.vpc-id}"
}

output "security-group-id" {
  value = "${aws_security_group.security-group.id}"
}
