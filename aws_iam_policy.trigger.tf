resource "aws_iam_policy" "trigger" {
  count = "${var.reponame == "" ? 0 : 1}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "codebuild:StartBuild",
            "Resource": "${aws_codebuild_project.project.arn}"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attachtotriggerrole" {
  count      = "${var.reponame == "" ? 0 : 1}"
  role       = aws_iam_role.trigger.0.name
  policy_arn = aws_iam_policy.trigger.0.arn
}
