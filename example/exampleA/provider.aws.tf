provider "aws" {
  region  = "eu-west-1"
  version = "2.18"
}

provider "local" {
  version = "1.2"
}

provider "template" {
  version = "2.1"
}