data "aws_iam_policy_document" "codebuild_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:List*",
      "s3:PutObject",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation"
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
      "codebuild:StartBuild",
      "codebuild:StopBuild",
      "codebuild:UpdateProject"
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetAuthorizationToken",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload"
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
