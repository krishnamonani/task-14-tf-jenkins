terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "jenkins-terraform-bucket-${random_integer.suffix.result}"

  tags = {
    Name        = "Task bucket tf jenkins"
  }
}

output "bucket_name" {
    value = aws_s3_bucket.my_bucket.bucket
}