resource "aws_security_group" "web_sg" {
  name        = "allow-web-traffic"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = basename(data.terraform_remote_state.network.outputs.vpc_arn)
  tags = {
    Name = "my-web-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_sg_ingress_ping" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "icmp"
  from_port         = -1 # Allow all icmp codes
  to_port           = -1 # Allow all icmp codes
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "web_sg_ingress_ssh" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "web_sg_ingress_http" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "web_sg_ingress_https" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "web_sg_egress_all" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4 = "0.0.0.0/0"
}