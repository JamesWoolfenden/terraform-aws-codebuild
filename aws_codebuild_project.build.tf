resource "aws_codebuild_project" "build" {
  name           = replace(var.name, ".", "-")
  description    = var.description
  service_role   = var.role == "" ? one(aws_iam_role.codebuild[*].arn) : one(data.aws_iam_role.existing[*].arn)
  build_timeout  = var.build_timeout
  encryption_key = var.kms_key_id

  cache {
    type  = var.cache_type
    modes = local.cache_modes
  }

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

  logs_config {
    # Declared explicitly rather than relying on the AWS default: the group
    # name is what data_iam_policy.codebuild_policy.tf scopes logs:* to, so
    # the two must not drift.
    cloudwatch_logs {
      status      = "ENABLED"
      group_name  = "/aws/codebuild/${replace(var.name, ".", "-")}"
      stream_name = "build"
    }

    s3_logs {
      #default value false
      encryption_disabled = false
      status              = "ENABLED"
      location            = var.logs_bucket
    }
  }

}
