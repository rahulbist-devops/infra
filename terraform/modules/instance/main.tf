resource "aws_instance" "host" {
  ami = "${var.host-ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet-id}"

  associate_public_ip_address = "${var.associate-public-ip-address}"
  key_name = "${var.instance-key-name}"
  vpc_security_group_ids = ["${var.security-groups}"]
  user_data = "${var.userdata}"

  tags {
    Name = "${var.instance-name}"
    terraformManaged = true
  }
}
  
output "instance-id" {
  value = "${aws_instance.host.id}"
}
  
output "public-dns" {
    value = "${aws_instance.host.public_dns}"

}
