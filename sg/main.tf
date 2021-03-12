provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0eeb03e72075b9bcc"
    instance_type="t2.micro"
    security_groups = [aws_security_group.webtraffic.name ]
  
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  ingress{
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks=["0.0.0.0/0"]
  }

  egress{
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks=["0.0.0.0/0"]

  }
}
