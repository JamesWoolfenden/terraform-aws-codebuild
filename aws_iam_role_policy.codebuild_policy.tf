resource "aws_iam_role_policy" "codebuild_policy" {
  name = "${module.unique_label.name}-codebuild-policy"
  role = "${aws_iam_role.codebuild_assume_role.id}"

  policy = "${data.aws_iam_policy_document.codebuild_policy.json}"
}
