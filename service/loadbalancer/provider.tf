terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    profile = "eks-offer"
    bucket         = "hyosung-fms-workshop-s3-backend"
    key            = "dr/lb/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "hyosung-fms-workshop-dynamodb-tfstate"
    acl            = "bucket-owner-full-control"
  }
}

provider "aws" {
  region  = "ap-northeast-2"
  profile = "eks-offer"

  # default_tags {
  #   tags = {
  #     User = "jigreg" # Replace with your name
  #   }
  # }
}

#   backend "s3" {
#     profile        = "team"
#     bucket         = "jigreg"
#     key            = "dr/lb/terraform.tfstate"
#     region         = "ap-northeast-2"
#     encrypt        = true
#     dynamodb_table = "seojun-terraform-lock"
#     acl            = "bucket-owner-full-control"
#   }
# }

# provider "aws" {
#   region  = "ap-northeast-2"
#   profile = "team"

#   default_tags {
#     tags = {
#       User = "jigreg"
#     }
#   }
# }
