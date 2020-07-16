provider "aws" {}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["679593333241"]
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

resource "aws_key_pair" "us-east-1-key" {
  key_name   = "bastion_bastion"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}



resource "aws_instance" "jenkins" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  key_name      =   "${aws_key_pair.us-east-1-key.key_name}"
  provisioner "remote-exec" {
    connection {
        type            = "ssh"
        user            = "centos"
        private_key     = "${file("~/.ssh/id_rsa")}"
        host            = "${self.public_ip}"
    }
  tags = {
    Name = "Jenkins"
  }
  }
}

  # resource "aws_instance" "jenkins" {
  #   ami           = "ami-08f3d892de259504d"
  #   instance_type = "t2.micro"
  #   tags = {
  #     Name = "Jenkins"
  #   }
  # }
  