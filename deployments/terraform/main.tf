provider "aws" {
  version = "2.59"
}

# data "aws_ami" "centos" {
#   most_recent = true
#   owners      = ["679593333241"]
#   filter {
#     name   = "state"
#     values = ["available"]
#   }
#   filter {
#     name   = "name"
#     values = ["CentOS Linux 7 x86_64 HVM EBS *"]
#   }
# }


resource "aws_instance" "jenkins" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  # key_name      = "${aws_key_pair.jenkins_key.key_name}"
  tags = {
    Name = "${var.instance_name}"
  }
}
variable "ami" {}
variable "instance_name" {}

  # resource "aws_instance" "jenkins" {
  #   ami           = "ami-08f3d892de259504d"
  #   instance_type = "t2.micro"
  #   tags = {
  #     Name = "Jenkins"
  #   }
  # }
  
