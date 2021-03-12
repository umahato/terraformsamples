
resource "aws_instance" "web" {
  ami="ami-0eeb03e72075b9bcc"
  instance_type ="t2.micro"
  # first create the security group than define below
  security_groups = [module.sg.sg_name]
  user_data = file("./web/server-script.sh")


  tags = {
      Name = "Web Server"
  }
}

output "pub_ip" {
  value = module.eip.PublicIP
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web.id
  
}

module "sg" {
  source = "../sg"
  
}

