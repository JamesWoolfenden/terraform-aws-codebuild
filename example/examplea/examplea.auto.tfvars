description            = "Description fitting of such a repos"
force_artifact_destroy = "true"

projectroot = "example"

sourcecode = {
  type      = "CODECOMMIT"
  location  = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/examplea"
  buildspec = ""
}

common_tags = {
  name        = "examplea"
  "createdby" = "Terraform"
  module      = "terraform-aws-codebuild"
}
