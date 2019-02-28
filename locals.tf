locals {
  bucketname = "${var.name}-${data.aws_caller_identity.current.account_id}-artifacts"
}
