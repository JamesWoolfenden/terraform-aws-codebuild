name                      = "exampleA"
reponame                  = "exampleA"
projectroot               = "example"
description               = "Description fitting of such a repos"
force_artifact_destroy    = "true"
build_timeout             = "60"
type                      = "S3"
encryption_disabled       = true
namespace_type            = "NONE"
packaging                 = "NONE"

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
    name="exampleA"
  }
