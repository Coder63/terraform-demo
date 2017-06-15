
resource "aws_instance" "test" {

  ami = "ami-efd0428f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${var.ssh_http_sg_id}"]
  subnet_id="${var.terraform_subnet_id}"

  tags {
    Name = "terraform-FSS-two"
    SG= "${var.ssh_http_sg_id}"
    VPC="${var.terraform_vpc_id}"
    subnet = "${var.terraform_subnet_id}"
  }
}
