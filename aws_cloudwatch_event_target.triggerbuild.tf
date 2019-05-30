resource "aws_cloudwatch_event_target" "triggerbuild" {
  count    = "${var.reponame == "" ? 0 : 1}"
  rule     = "${aws_cloudwatch_event_rule.codechange.arn}"
  arn      = "${aws_codebuild_project.project.arn}"
  role_arn = "${aws_iam_role.trigger.arn}"
}
