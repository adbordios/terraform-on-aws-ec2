# Resource EC2 Instance
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t3.micro"
  user_data     = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Terraform Demo"
  }
}