
resource "aws_instance" "test" {

  ami = "ami-efd0428f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${var.ssh_http_sg_id}"]
  subnet_id="${var.terraform_subnet_id}"

  resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.web.id}"
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 3
}
  
  tags {
    Name = "terraform-FSS-two"
    SG= "${var.ssh_http_sg_id}"
    VPC="${var.terraform_vpc_id}"
    subnet = "${var.terraform_subnet_id}"
  }
}
