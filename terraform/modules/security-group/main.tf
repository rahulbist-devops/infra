resource "aws_security_group" "security-group" {
  name = "${var.security-group-name}"
  vpc_id = "${var.vpc-id}"

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.cidr}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

output "security-group-id" {
  value = "${aws_security_group.security-group.id}"
}
