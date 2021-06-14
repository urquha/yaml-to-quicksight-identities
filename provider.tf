terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 1.0"
  }
}


provider "aws" {
  region = var.region
}