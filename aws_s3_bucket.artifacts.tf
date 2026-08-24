resource "aws_s3_bucket" "artifacts" {
  # holden:ignore:HLD_AWS_310: Object Lock cannot be enabled on an existing
  # bucket (it forces replacement) and its write-once retention directly
  # contradicts the artifact_expiry lifecycle rule below, which is the whole
  # point of this bucket: build artifacts are disposable and expire on a
  # schedule. Versioning plus the expiry rule is the correct posture here.
  count         = var.bucketname == "" ? 1 : 0
  bucket        = local.bucketname
  force_destroy = var.force_artifact_destroy
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts" {
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

    # Versioning is on by default, so every expiry above leaves a noncurrent
    # version behind. Without this the bucket grows without bound.
    noncurrent_version_expiration {
      noncurrent_days = var.artifact_noncurrent_expiry
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 14
    }
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "artifacts" {
  count  = var.bucketname == "" ? 1 : 0
  bucket = aws_s3_bucket.artifacts[0].id
  versioning_configuration {
    status     = var.versioning
    mfa_delete = var.mfa_delete
  }
}

# BucketOwnerEnforced disables ACLs outright: every object is owned by the
# bucket owner and ACL grants are ignored. This replaces the previous
# aws_s3_bucket_acl "private" resource, which cannot coexist with it — the
# bucket is private by default under this setting, without a legacy ACL.
resource "aws_s3_bucket_ownership_controls" "artifacts" {
  count  = var.bucketname == "" ? 1 : 0
  bucket = aws_s3_bucket.artifacts[0].id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Server access logging for the artifact bucket, sent to the same bucket the
# CodeBuild project writes its build logs to.
resource "aws_s3_bucket_logging" "artifacts" {
  count         = var.bucketname == "" ? 1 : 0
  bucket        = aws_s3_bucket.artifacts[0].id
  target_bucket = local.logs_bucket_name
  target_prefix = local.logs_bucket_prefix
}
