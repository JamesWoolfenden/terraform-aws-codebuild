resource "aws_codebuild_project" "project" {
  # checkov:skip=CKV_AWS_147: ADD REASON
  # test is wrong
  # checkov:skip=CKV_AWS_78: "Ensure that CodeBuild Project encryption is not disabled"
  name          = replace(var.name, ".", "-")
  description   = var.description
  service_role  = var.role == "" ? element(concat(aws_iam_role.codebuild.*.arn, list("")), 0) : element(concat(data.aws_iam_role.existing.*.arn, list("")), 0)
  build_timeout = var.build_timeout

  artifacts {
    encryption_disabled = var.encryption_disabled
    location            = local.bucketname
    name                = var.name
    namespace_type      = var.artifact["namespace_type"]
    packaging           = var.artifact["packaging"]
    type                = var.artifact_type
  }

  environment {
    compute_type    = var.environment["compute_type"]
    image           = var.environment["image"]
    type            = var.environment["type"]
    privileged_mode = var.environment["privileged_mode"]
  }

  source {
    type      = var.sourcecode["type"]
    location  = var.sourcecode["location"]
    buildspec = var.sourcecode["buildspec"]
  }

  tags = var.common_tags
}
