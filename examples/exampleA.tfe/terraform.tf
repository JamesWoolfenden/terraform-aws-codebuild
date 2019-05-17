terraform {
  version = "0.11.13"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "wolf"

    workspaces {
      name = "terraform-aws-codebuild-exampleA"
    }
  }
}
