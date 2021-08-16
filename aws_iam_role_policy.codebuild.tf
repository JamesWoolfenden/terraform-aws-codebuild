resource "aws_iam_role_policy" "codebuild" {
  name  = "codebuild-${var.name}"
  count = var.role == "" ? 1 : 0
  role  = aws_iam_role.codebuild.0.id

  policy = data.aws_iam_policy_document.codebuild.json
}
