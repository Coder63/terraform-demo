# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file
# except in compliance with the License. A copy of the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed on an "AS IS"
# BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under the License.
variable "region" {
  default = "us-west-2"
}

# profile name
variable "profile"{
  default = "uit"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "172.0.0.0/16"
}

variable "ip_range" {
  default = "0.0.0.0/0" # Change to your IP Range!
}
