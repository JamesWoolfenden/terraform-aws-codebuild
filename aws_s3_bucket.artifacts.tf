
resource "aws_s3_bucket" "artifacts" {

  # checkov:skip=CKV_AWS_144:LEGACY
  # checkov:skip=CKV2_AWS_61:
  # checkov:skip=CKV_AWS_18:LEGACY
  # checkov:skip=CKV2_AWS_62::OVERKILL
  count         = var.bucketname == "" ? 1 : 0
  bucket        = local.bucketname
  force_destroy = var.force_artifact_destroy
}


resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  count  = var.bucketname == "" ? 1 : 0
  bucket = aws_s3_bucket.artifacts[0].bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_key_id
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "pike" {
  count  = var.bucketname == "" ? 1 : 0
  bucket = aws_s3_bucket.artifacts[0].id
  rule {
    id = "expire"

    expiration {
      days = var.artifact_expiry
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 14
    }
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "example" {
  count  = var.bucketname == "" ? 1 : 0
  bucket = aws_s3_bucket.artifacts[0].id
  versioning_configuration {
    status     = var.versioning
    mfa_delete = var.mfa_delete
  }
}



resource "aws_s3_bucket_acl" "example" {
  count  = var.bucketname == "" ? 1 : 0
  bucket = aws_s3_bucket.artifacts[0].id
  acl    = "private"
}



variable "artifact_expiry" {
  type        = number
  default     = 365
  description = "number of days"
}
