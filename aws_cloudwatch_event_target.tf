resource "aws_cloudwatch_event_target" "triggerbuild" {
  rule     = "${aws_cloudwatch_event_rule.codechange.name}"
  arn      = "${aws_codebuild_project.project.arn}"
  role_arn = "${aws_iam_role.trigger.arn}"
}
