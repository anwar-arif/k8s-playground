output "ubuntu_image" {
  description = "ubuntu machine arn"
  value = data.aws_ami.ubuntu.arn
}
