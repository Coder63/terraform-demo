
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "172.0.0.0/16"
}

variable "private_subnet_a_cidr" {
    description = "CIDR for the Private Subnet"
    default = "172.0.0.0/20"
}
