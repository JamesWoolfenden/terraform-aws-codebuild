resource "aws_codebuild_project" "project" {
  name          = replace(var.name, ".", "-")
  description   = var.description
  service_role  = "${var.role == "" ? element(concat(aws_iam_role.codebuild.*.arn, list("")), 0) : element(concat(data.aws_iam_role.existing.*.arn, list("")), 0)}"
  build_timeout = var.build_timeout

  artifacts {
    encryption_disabled = var.artifact["encryption_disabled"]
    location            = local.bucketname
    name                = var.name
    namespace_type      = var.artifact["namespace_type"]
    packaging           = var.artifact["packaging"]
    type                = var.artifact["type"]
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
