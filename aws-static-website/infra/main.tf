terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure AWS provider
provider "aws" {
  region = var.aws_region
}

# Init S3 bucket
resource "aws_s3_bucket" "static_website_bucket" {
  tags = {
    "key" = "Static Website Bucket"
  }

  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "static_website_bucket_configuration" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

