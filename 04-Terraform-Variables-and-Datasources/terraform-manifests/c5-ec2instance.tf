# Resource EC2 Instance
resource "aws_instance" "my_ec2_instance" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]
  tags = {
    "Name" = "EC2 Terraform Demo 2"
  }
}