resource "aws_codebuild_project" "project" {
  name          = "${var.name}"
  description   = "${var.description}"
  service_role  = "${var.role == "" ? element(concat(aws_iam_role.codebuild.*.arn, list("")), 0) : element(concat(data.aws_iam_role.existing.*.arn, list("")), 0) }"
  build_timeout = "${var.build_timeout}"

  artifacts {
    type           = "S3"
    location       = "${aws_s3_bucket.artifacts.bucket_domain_name}"
    name           = "${var.name}"
    namespace_type = "${var.namespace_type}"
    packaging      = "${var.packaging}"
  }

  environment = "${var.environment}"
  source      = "${var.sourcecode}"
  tags        = "${var.common_tags}"
}
