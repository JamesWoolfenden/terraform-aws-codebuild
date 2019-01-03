resource "aws_iam_policy" "trigger" {
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
  role       = "${aws_iam_role.trigger.name}"
  policy_arn = "${aws_iam_policy.trigger.arn}"
}
