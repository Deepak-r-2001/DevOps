terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Define providers for each region
provider "aws" {
  alias  = "use1"
  region = var.aws_regions[0]
}

provider "aws" {
  alias  = "aps1"
  region = var.aws_regions[1]
}
