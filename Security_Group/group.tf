# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "ssh_http_sg" {
  name = "ssh_http_sg_2"
  description = "Allow SSH & http host"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.ip_range}"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.ip_range}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${var.terraform_vpc_id}"
  tags {
      Name = "terraform_ssh_http_sg_2"
  }
}

output "ssh_http_sg_id" {
  value = "${aws_security_group.ssh_http_sg.id}"
}
