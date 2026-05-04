resource "aws_iam_role_policy" "codebuild" {
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  name  = "codebuild-${var.name}"
  count = var.role == "" ? 1 : 0
  role  = aws_iam_role.codebuild.0.id

  policy = data.aws_iam_policy_document.codebuild.json
}
