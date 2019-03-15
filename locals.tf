locals {
  bucket     = "${var.name}-${data.aws_caller_identity.current.account_id}-artifact"
  bucketname = "${var.bucketname == "" ? local.bucket : var.bucketname}"
}
