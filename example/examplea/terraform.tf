terraform {
  required_providers {
    aws = {
      version = "4.58.0"
      source  = "hashicorp/aws"
    }
    local = {
      version = "2.4.0"
    }

    random = {
      version = "3.4.3"
    }
  }
  required_version = ">=0.14.8"
}
