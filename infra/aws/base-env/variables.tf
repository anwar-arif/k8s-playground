variable "region" {
  type        = string
  description = "aws region"
  default     = "us-east-1"
}

variable "tf_state_bucket_name" {
  type = string
  description = "terraform state bucket name"
  default = "20261112-anwar"
}