resource "aws_codebuild_project" "project" {
  name          = "${var.name}"
  description   = "The CodeBuild project for code in ${var.name}"
  service_role  = "${aws_iam_role.codebuild.arn}"
  build_timeout = "${var.build_timeout}"
  artifacts     = "${var.artifacts}"
  environment   = "${var.environment}"
  source        = "${var.sourcecode}"
  tags          = "${var.common_tags}"
}
