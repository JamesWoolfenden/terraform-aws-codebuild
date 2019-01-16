resource "aws_codebuild_project" "project" {
  name          = "${var.name}"
  description   = "${var.description}"
  service_role  = "${aws_iam_role.codebuild.arn}"
  build_timeout = "${var.build_timeout}"

  artifacts {
    type           = "S3"
    location       = "${aws_s3_bucket.artifacts.bucket_domain_name}"
    name           = "${var.name}"
    namespace_type = "BUILD_ID"
    packaging      = "ZIP"
  }

  environment = "${var.environment}"
  source      = "${var.sourcecode}"
  tags        = "${var.common_tags}"
}
