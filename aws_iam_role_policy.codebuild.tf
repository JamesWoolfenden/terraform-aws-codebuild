resource "aws_iam_role_policy" "codebuild_policy" {
  name  = "codebuildpolicy-${var.name}"
  count = var.role == "" ? 1 : 0
  role  = aws_iam_role.codebuild.0.id

  policy = data.aws_iam_policy_document.codebuild_policy.json
}
