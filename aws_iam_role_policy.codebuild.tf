resource "aws_iam_role_policy" "codebuild_policy" {
  role = "${aws_iam_role.codebuild.id}"

  policy = "${data.aws_iam_policy_document.codebuild_policy.json}"
}
