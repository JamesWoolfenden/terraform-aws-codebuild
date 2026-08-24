locals {
  bucket     = "${var.name}-${data.aws_caller_identity.current.account_id}-artifacts"
  bucketname = var.bucketname == "" ? local.bucket : var.bucketname

  # var.logs_bucket is a bucket name optionally followed by a path: the first
  # segment is the target bucket, anything after it is the log object prefix.
  logs_bucket_parts = split("/", var.logs_bucket)
  logs_bucket_name  = local.logs_bucket_parts[0]
  # modes is only valid for a LOCAL cache; the provider rejects it otherwise.
  cache_modes = var.cache_type == "LOCAL" ? var.cache_modes : null

  logs_bucket_prefix = length(local.logs_bucket_parts) > 1 ? join("/", slice(local.logs_bucket_parts, 1, length(local.logs_bucket_parts))) : "artifacts/"
}
