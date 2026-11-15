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
  from_port         = -1
  to_port           = -1
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "web_sg_ingress_ssh" {
  security_group_id = aws_security_group.web_sg.id

  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "0.0.0.0/0"
}