data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "custom_kms_key" {
  # holden:ignore:HLD_AWS_222: in a KMS key policy, Resource "*" means "this
  # key" — the policy is attached to the key itself and cannot reference it
  # by ARN. The EnableAccountRootAccess statement is the AWS-required idiom
  # that keeps the key manageable by the account root; without it the key
  # can become permanently unmanageable.
  statement {
    sid    = "EnableAccountRootAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions   = ["kms:*"]
    resources = ["*"]
  }
}

resource "aws_kms_key" "custom" {
  enable_key_rotation = true

  deletion_window_in_days = 30
  policy                  = data.aws_iam_policy_document.custom_kms_key.json

  lifecycle {
    prevent_destroy = true
  }
}
