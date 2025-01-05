# Resource EC2 Instance
resource "aws_instance" "my_ec2_instance" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type          = var.instance_type
  # instance_type = var.instance_type_list[1] # Syntax for list
  instance_type = var.instance_type_map["prod"] # Syntax for map
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]
  count                  = 2
  tags = {
    "Name" = "Count-Demo-${count.index}"
  }
}