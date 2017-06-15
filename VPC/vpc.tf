
resource "aws_vpc" "terraform-vpc-dev" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
      Name = "terraform-vpc-dev_2"
  }
}

 resource "aws_internet_gateway" "default" {
   vpc_id= "${aws_vpc.terraform-vpc-dev.id}"
 }

 /*
   Public Subnet
 */
 resource "aws_subnet" "us-west-2a-private" {
     vpc_id = "${aws_vpc.terraform-vpc-dev.id}"

     cidr_block = "${var.private_subnet_a_cidr}"
     availability_zone = "us-west-2a"

     tags {
         Name = "Private terraform Subnet 2A"
     }
 }

 resource "aws_route_table" "us-west-2a-private" {
     vpc_id = "${aws_vpc.terraform-vpc-dev.id}"

     route {
         cidr_block = "0.0.0.0/0"
         gateway_id = "${aws_internet_gateway.default.id}"
     }

     tags {
         Name = "Private terraform Subnet 2"
     }
 }

 resource "aws_route_table_association" "us-west-2a-private" {
     subnet_id = "${aws_subnet.us-west-2a-private.id}"
     route_table_id = "${aws_route_table.us-west-2a-private.id}"
 }

 output "terraform_vpc_id" {
   value= "${aws_vpc.terraform-vpc-dev.id}"
 }

 output "terraform_subnet_id" {
   value= "${aws_subnet.us-west-2a-private.id}"

 }
