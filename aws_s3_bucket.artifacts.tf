resource "aws_s3_bucket" "artifacts" {
  bucket        = "${local.bucketname}"
  acl           = "private"
  force_destroy = "${var.force_artifact_destroy}"
}
