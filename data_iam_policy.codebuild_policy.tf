data "aws_iam_policy_document" "codebuild_policy" {
  statement {
    actions = [
      "*",
    ]

    resources = [
      "arn:aws:s3:::${local.bucketname}",
      "arn:aws:s3:::${local.bucketname}/*",
      "arn:aws:s3:::codepipeline-${data.aws_region.current.name}-163714928765/*",
      "arn:aws:s3:::codepipeline-${data.aws_region.current.name}-163714928765",
    ]
  }

  statement {
    actions = [
      "codebuild:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "ecr:*",
    ]

    resources = [
      "*",
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
