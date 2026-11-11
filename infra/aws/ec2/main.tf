data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-focal-20.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "905418290018-kk-labs-user-597258"
    key = "network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_key_pair" "my_key_pair" {
  key_name = "tf-key"
  public_key = file("~/.ssh/my-aws-key.pub")
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.1"

  name = "my-ec2"
  ami = data.aws_ami.ubuntu.id

  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key_pair.key_name
  monitoring    = true
  subnet_id     = data.terraform_remote_state.network.outputs.public_subnets[0].id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
