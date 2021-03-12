resource "aws_instance" "db" {
  ami="ami-0eeb03e72075b9bcc"
  instance_type ="t2.micro"

  tags = {
      Name = "DB Server"
  }
} 


output "PrivateIP" {
    value=aws_instance.db.private_ip
  }
