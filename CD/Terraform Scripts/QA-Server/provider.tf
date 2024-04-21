provider "aws" {
  region = "ap-southeast-2"
}

/*resource "aws_dynamodb_table" "tf_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }

  lifecycle {
    prevent_destroy = true
  }

}*/


terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "project-bin9638"
    key    = "jenkins/terraform.tfstate"
    region = "ap-southeast-2"
    // dynamodb_table = "terraform-lock"
  }
}

