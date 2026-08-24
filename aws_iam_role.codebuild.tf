resource "aws_iam_role" "codebuild" {
  name                 = "codebuildrole-${var.name}"
  count                = var.role == "" ? 1 : 0
  max_session_duration = 3600

  # aws:SourceAccount scopes the trust to this account only, closing the
  # confused-deputy hole where the CodeBuild service principal could be
  # induced to assume this role on behalf of another account. SourceArn is
  # deliberately not used: it would reference the project, which already
  # references this role, creating a dependency cycle.
  assume_role_policy = <<HERE
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codebuild.amazonaws.com"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "StringEquals": {
                    "aws:SourceAccount": "${data.aws_caller_identity.current.account_id}"
                }
            }
        }
    ]
}
HERE

}
