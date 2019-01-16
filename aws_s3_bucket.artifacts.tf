resource "aws_s3_bucket" "artifacts" {
  bucket        = "${var.name}-${data.aws_caller_identity.current.account_id}-artifacts"
  acl           = "private"
  force_destroy = "${var.force_artifact_destroy}"
}
