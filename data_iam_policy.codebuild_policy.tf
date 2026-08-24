data "aws_iam_policy_document" "codebuild" {
  # holden:ignore:HLD_AWS_222: the sole remaining wildcard resource is the
  # ecr:GetAuthorizationToken statement below, which AWS requires to be "*".
  # Every other statement in this document is scoped to a specific ARN.

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
    ]
  }

  statement {
    actions = [
      "codebuild:StartBuild",
      "codebuild:StopBuild",
      "codebuild:UpdateProject"
    ]

    resources = [
      aws_codebuild_project.build.arn,
    ]
  }

  # ecr:GetAuthorizationToken is the one ECR action that has no resource to
  # scope to — the token is account-level, and AWS rejects the call if the
  # statement names any resource other than "*". It is read-only and grants
  # nothing on its own beyond the ability to obtain a registry login, so it
  # is isolated in its own statement rather than widening the repository
  # permissions below.
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload"
    ]

    resources = [
      "arn:aws:ecr:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:repository/*",
    ]
  }

  # Scoped to the parameter path this module actually creates and the
  # buildspec writes back to: /<projectroot>/codebuild/<name>/*
  statement {
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:PutParameter",
    ]

    resources = [
      "arn:aws:ssm:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:parameter/${var.projectroot}/codebuild/${var.name}/*",
    ]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${replace(var.name, ".", "-")}",
      "arn:aws:logs:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${replace(var.name, ".", "-")}:*",
    ]
  }

  # iam:PassRole is the escalation-class action here: unscoped, it lets a build
  # hand any role in the account to any service. It is limited to this module's
  # own build role, and further conditioned so the role can only be passed to
  # CodeBuild itself. iam:ListRoles was dropped rather than scoped — it cannot
  # take a resource ARN, and a build has no need to enumerate account roles.
  statement {
    actions = [
      "iam:PassRole",
    ]

    resources = [
      var.role == "" ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/codebuildrole-${var.name}" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.role}",
    ]

    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["codebuild.amazonaws.com"]
    }
  }
}
