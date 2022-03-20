
resource "aws_s3_bucket" "artifacts" {
  # checkov:skip=CKV2_AWS_6: ADD REASON
  # checkov:skip=CKV2_AWS_41: ADD REASON
  # checkov:skip=CKV_AWS_18:LEGACY
  # checkov:skip=CKV_AWS_144:LEGACY
  # checkov:skip=CKV_AWS_19:LEGACY
  # checkov:skip=CKV_AWS_145:LEGACY
  # checkov:skip=CKV_AWS_21:LEGACY
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
