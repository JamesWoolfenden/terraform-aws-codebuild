description            = "The CodeBuild project for code in aws-lexbot-handler"
force_artifact_destroy = "false"
name                   = "exampleA-more-iam-permissions"
projectroot            = "example"
sourcecode = {
  type      = "CODECOMMIT"
  location  = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/exampleA"
  buildspec = ""
}
common_tags = {
  name = "example-more-iam-permissions"
}
