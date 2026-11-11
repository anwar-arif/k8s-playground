terraform {
  backend "s3" {
    bucket = "905418290018-kk-labs-user-597258"
    key = "network"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}