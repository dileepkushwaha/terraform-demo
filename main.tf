terraform {
  cloud {
    organization = "vayoti"

    workspaces {
      name = "terraform-1"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }

  }
}


provider "aws" {
  # Configuration options
  region     = "us-west-2"
  access_key = "djas;lkjdlas"
  secret_key = "jklfsjflksjfldskjfslkdjflskdjflksdjf"
  
}
variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-west-2"
}
provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length  = 16
  special = false
  lower   = true
  upper   = false
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}
output "random_bucket_name" {
  value = random_string.bucket_name.id
}

output "random_bucket_name_result" {
  value = random_string.bucket_name.result
}

