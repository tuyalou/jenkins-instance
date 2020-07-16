provider "aws" {}

resource "aws_instance" "jenkins" {
  ami           = "ami-0ba960472fc891755"
  instance_type = "t2.micro"
  tags = {
    Name = "Jenkins"
  }
}