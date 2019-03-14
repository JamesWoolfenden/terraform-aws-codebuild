data "aws_iam_policy_document" "codebuild_policy" {
  statement {
    actions = [
      "*",
    ]

    resources = [
      "arn:aws:s3:::${var.bucketname}",
      "arn:aws:s3:::${var.bucketname}/*",
    ]
  }

  statement {
    actions = [
      "codebuild:*",
    ]

    resources = [
      "${aws_codebuild_project.project.id}",
    ]
  }

  statement {
    actions = [
      "ssm:GetParameters",
      "ssm:PutParameter",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "iam:ListRoles",
      "iam:PassRole",
    ]

    resources = [
      "*",
    ]
  }
}
