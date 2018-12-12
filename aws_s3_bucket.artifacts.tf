resource "aws_s3_bucket" "artifacts" {
  bucket        = "${module.unique_label.id}"
  acl           = "private"
  force_destroy = "${var.force_artifact_destroy}"
}
