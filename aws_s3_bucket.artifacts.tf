resource "aws_s3_bucket" "artifacts" {
  #checkov:skip=CKV_AWS_18:"Ensure the S3 bucket has access logging enabled"
  #checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  count         = var.bucketname == "" ? 1 : 0
  bucket        = local.bucketname
  acl           = "private"
  force_destroy = var.force_artifact_destroy

  versioning {
    enabled    = var.versioning
    mfa_delete = var.mfa_delete
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
}


variable "versioning" {
  type        = boolean
  description = "Set bucket to version, probably not as you shouldn't update releases"
  default     = false
}


variable "mfa_delete" {
  type        = boolean
  description = "Require MFA to delete"
  default     = true
}
