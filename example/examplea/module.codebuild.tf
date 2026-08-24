module "codebuild" {
  # holden:ignore:HLD_TF_026: "../../" is the required shape for an example
  # that exercises the module in its own repository — the example lives at
  # example/examplea/ and the module root is two levels up. There is no
  # shallower path that reaches it.
  # holden:ignore:HLD_TF_073: a CodeBuild project inherently composes the
  # project, its IAM role and policies, the artifact bucket and its five
  # configuration companions, the SSM parameters and the CloudWatch trigger.
  # Splitting these apart would produce modules that cannot be used alone.
  source                 = "../../"
  description            = var.description
  force_artifact_destroy = var.force_artifact_destroy
  name                   = random_string.random.result
  projectroot            = var.projectroot
  sourcecode             = var.sourcecode
  kms_key_id             = aws_kms_key.custom.key_id
  logs_bucket            = "logging-${data.aws_caller_identity.current.account_id}/codebuild/"
}
