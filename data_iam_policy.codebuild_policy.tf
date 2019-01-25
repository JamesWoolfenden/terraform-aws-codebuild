data "aws_iam_policy_document" "codebuild_policy" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
    ]

    resources = [
      "*",
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
}
