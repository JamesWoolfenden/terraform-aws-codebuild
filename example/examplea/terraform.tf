terraform {
  required_providers {
    aws = {
      version = "4.62.0"
      source  = "hashicorp/aws"
    }
    local = {
      version = "2.4.0"
    }

    random = {
      version = "3.4.3"
      source  = "hashicorp/random"
    }
  }
  required_version = ">=1.3.0"
}
