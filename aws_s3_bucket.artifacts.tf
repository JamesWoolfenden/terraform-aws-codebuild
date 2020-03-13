resource "aws_s3_bucket" "artifacts" {
  #checkov:skip=CKV_AWS_18:"Ensure the S3 bucket has access logging enabled"

  count         = var.bucketname == "" ? 1 : 0
  bucket        = local.bucketname
  acl           = "private"
  force_destroy = var.force_artifact_destroy
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
}
