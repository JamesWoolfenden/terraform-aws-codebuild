terraform {
  required_providers {
    aws = {
      version = "3.8.0"
      source  = "hashicorp/aws"
    }
    local = {
      version = "1.2"
    }

    template = {
      version = "2.1"
    }

    random = {
      version = "~> 2.2"
    }
  }
}
