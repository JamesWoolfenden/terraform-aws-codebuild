terraform {
  required_providers {
    local = {
      version = "1.2"
    }

    random = {
      version = "2.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
}
