variable "region" {
  type        = string
  description = "aws region"
  default     = "us-east-1"
}

variable "aws_account_id" {
  type        = string
  description = "aws account id"
  default     = "590184106649"
}

variable "aws_user_id" {
  type        = string
  description = "aws user id"
  default     = "kk_labs_user_774862"
}

variable "tf_state_bucket_name" {
  type = string
  description = "terraform state bucket name"
  default = "20261112-anwar"
}