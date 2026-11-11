terraform {
  backend "s3" {
    bucket         = "20261112-anwar"
    key            = "ec2"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}