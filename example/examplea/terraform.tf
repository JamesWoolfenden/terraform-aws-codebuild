terraform {
  required_providers {
    local = {
      version = "2.4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
  required_version = ">=1.3.0"
}
