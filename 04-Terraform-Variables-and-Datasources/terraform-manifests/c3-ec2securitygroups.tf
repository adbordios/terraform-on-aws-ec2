# Create Security Group - Allow SSH Traffic

resource "aws_security_group" "vpc_ssh" {
  name        = "vpc-ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"

  tags = {
    Name = "Allow SSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "vpc_ssh_allow_ssh_ipv4" {
  security_group_id = aws_security_group.vpc_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Allow SSH Port 22"
}

resource "aws_vpc_security_group_egress_rule" "vpc_ssh_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.vpc_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "vpc_ssh_allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.vpc_ssh.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# Create Security Group - Web Traffic

resource "aws_security_group" "vpc_web" {
  name        = "vpc-web"
  description = "Allow Web traffic"

  tags = {
    Name = "Allow Web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "vpc_web_allow_http_ipv4" {
  security_group_id = aws_security_group.vpc_web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow HTTP Port 80"
}

resource "aws_vpc_security_group_ingress_rule" "vpc_web_allow_https_ipv4" {
  security_group_id = aws_security_group.vpc_web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  description       = "Allow HTTP Port 443"
}

resource "aws_vpc_security_group_egress_rule" "vpc_web_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.vpc_web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "vpc_web_allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.vpc_web.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}