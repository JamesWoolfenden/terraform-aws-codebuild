resource "aws_iam_policy" "additionalneeds" {
  name = "additionalneeds"

  policy = <<HERE
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "lex:*",
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "s3:*",
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
