resource "aws_iam_policy" "additionalneeds" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  name = "additionalneeds"

  policy = <<HERE
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "s3:listbuckets",
            "Resource": [
                "arn:aws:s3:::aws-lexbot-wilbur-${data.aws_caller_identity.current.account_id}-artifacts/*",
                "arn:aws:s3:::aws-lexbot-wilbur-${data.aws_caller_identity.current.account_id}-artifacts"
            ]
        }
        ]
}
HERE
}
resource "aws_iam_role_policy_attachment" "lex" {
  role       = module.codebuild.codebuild_role_name
  policy_arn = aws_iam_policy.additionalneeds.arn
  depends_on = ["aws_iam_policy.additionalneeds"]
}
