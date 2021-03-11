terraform {
  required_providers {
    aws = {
      version = "3.31.0"
      source  = "hashicorp/aws"
    }
    local = {
      version = "1.2"
    }

    template = {
      version = "2.1"
    }

    random = {
      version = "2.2"
    }
  }
  required_version = ">= 0.14"
}
