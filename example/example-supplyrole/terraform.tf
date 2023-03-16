terraform {
  required_providers {
    aws = {
      version = "4.6.0"
      source  = "hashicorp/aws"
    }
    local = {
      version = "1.2"
    }

    random = {
      version = "2.2"
    }
  }
}
