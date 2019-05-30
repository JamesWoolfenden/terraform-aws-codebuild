locals {
  bucket     = "${var.name}-${data.aws_caller_identity.current.account_id}-artifacts"
  bucketname = "${var.bucketname == "" ? local.bucket : var.bucketname}"
}
