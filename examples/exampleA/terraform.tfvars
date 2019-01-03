name                      = "exampleA"
organization_name         = "slalom"
char_delimiter            = "-"
repo_default_branch       = "master"
force_artifact_destroy    = "false"
build_timeout             = "60"

  artifacts=[{
    type           = "S3"
    location       = "${aws_s3_bucket.artifacts.bucket_domain_name}"
    name           = "exampleA"
    namespace_type = "NONE"
    packaging      = "NONE"
  }]

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
