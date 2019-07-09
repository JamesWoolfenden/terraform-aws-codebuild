resource "aws_codebuild_project" "project" {
  name          = "${replace(var.name, ".", "-")}"
  description   = var.description
  service_role  = "${var.role == "" ? element(concat(aws_iam_role.codebuild.*.arn, list("")), 0) : element(concat(data.aws_iam_role.existing.*.arn, list("")), 0)}"
  build_timeout = var.build_timeout

  artifacts {
    encryption_disabled = var.encryption_disabled
    location            = local.bucketname
    name                = var.name
    namespace_type      = var.namespace_type
    packaging           = var.packaging
    type                = var.artifact_type
  }

  environment {
    compute_type    = var.environment_compute_type
    image           = var.environment_image
    type            = var.environment_type
    privileged_mode = var.environment_privileged_mode
  }

  source {
    type      = var.source_type
    location  = var.source_location
    buildspec = var.source_buildspec
  }

  tags = var.common_tags
}
