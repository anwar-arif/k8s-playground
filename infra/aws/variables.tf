variable "region" {
  type = string
  description = "aws region"
  default = "us-east-1"
}

variable "aws_account_id" {
  type = string
  description = "aws account id"
  default = "590183746635"
}

variable "aws_user_id" {
  type = string
  description = "aws user id"
  default = "kk_labs_user_581455"
}

variable "terraform_state_bucket" {
  type = string
  description = "bucket name for terraform remote state"
  default = ""
}