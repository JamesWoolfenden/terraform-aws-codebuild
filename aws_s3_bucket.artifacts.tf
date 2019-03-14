resource "aws_s3_bucket" "artifacts" {
  bucket        = "${var.bucketname}"
  acl           = "private"
  force_destroy = "${var.force_artifact_destroy}"
}
