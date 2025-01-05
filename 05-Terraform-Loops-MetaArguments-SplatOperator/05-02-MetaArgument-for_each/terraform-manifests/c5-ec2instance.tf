# Availability Zones Datasource
data "aws_availability_zones" "my_azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

}

# Resource EC2 Instance
resource "aws_instance" "my_ec2_instance" {
  ami = data.aws_ami.amzlinux2.id
  # instance_type          = var.instance_type
  # instance_type = var.instance_type_list[1] # Syntax for list
  instance_type          = var.instance_type_map["prod"] # Syntax for map
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]
  # Create EC2 Instance for each availability zone
  for_each          = toset(data.aws_availability_zones.my_azs.names)
  availability_zone = each.key
  tags = {
    "Name" = "for_each-Demo-${each.value}"
  }
}