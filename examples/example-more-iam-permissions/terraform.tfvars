name                      = "aws-lexbot-handler"
projectroot               = "core"
description               = "The CodeBuild project for code in aws-lexbot-handler"
force_artifact_destroy    = "false"
build_timeout             = "60"

  environment =[{
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/nodejs:6.3.1"
    type            = "LINUX_CONTAINER"
    privileged_mode = "false"
  }]

  sourcecode=[{
    type      = "CODECOMMIT"
    buildspec = ""
    location  = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/exampleA"
  }]

  common_tags={
    name="example-more-iam-permissions"
  }
