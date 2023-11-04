terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }

  backend "s3" {
    bucket = "terraform-remote-state-bucket-paradoxo"
    key    = "aws-pipeline/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
  default_tags {
    tags = {
      Owner      = "Paradoxo"
      Managed-by = "Terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-remote-state-bucket-paradoxo"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
