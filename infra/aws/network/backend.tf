terraform {
  backend "s3" {
    bucket = "20261112-anwar"
    key = "network"
    region = "us-east-1"
    use_lockfile = true
  }
}