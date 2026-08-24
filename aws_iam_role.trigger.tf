resource "aws_iam_role" "trigger" {
  count                = var.reponame == "" ? 0 : 1
  path                 = "/service-role/"
  name                 = "eventtrigger-${var.reponame}"
  max_session_duration = 3600

  # Scoped to this account, and to the specific CloudWatch Events rule that
  # is allowed to assume it, so the EventBridge service principal cannot be
  # used as a confused deputy from elsewhere.
  assume_role_policy = <<PATTERN
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "events.amazonaws.com"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                    "aws:SourceAccount": "${data.aws_caller_identity.current.account_id}"
                },
                "ArnLike": {
                    "aws:SourceArn": "arn:aws:events:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:rule/codecommit-${var.name}"
                }
            }
        }
    ]
}
PATTERN

}
