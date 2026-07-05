terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.7.0"
    }
  }
  required_version = ">=1.15.7"
}

provider "google" {
  project = var.project_id
  region = var.region
}