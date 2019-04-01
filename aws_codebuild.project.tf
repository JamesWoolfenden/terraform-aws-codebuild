resource "aws_codebuild_project" "project" {
  name          = "${replace(var.name,".","-")}"
  description   = "${var.description}"
  service_role  = "${var.role == "" ? element(concat(aws_iam_role.codebuild.*.arn, list("")), 0) : element(concat(data.aws_iam_role.existing.*.arn, list("")), 0) }"
  build_timeout = "${var.build_timeout}"

  artifacts {
    type                = "${var.type}"
    location            = "${local.bucketname}"
    name                = "${var.name}"
    namespace_type      = "${var.namespace_type}"
    packaging           = "${var.packaging}"
    encryption_disabled = "${var.encryption_disabled}"
  }

  environment = "${var.environment}"
  source      = "${var.sourcecode}"
  tags        = "${var.common_tags}"
}
