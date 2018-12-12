# CodeBuild Section for the Package stage
resource "aws_codebuild_project" "build_project" {
  name           = "${var.reponame}-build"
  description    = "The CodeBuild project for code in ${var.reponame}"
  service_role   = "${aws_iam_role.codebuild_assume_role.arn}"
  build_timeout  = "${var.build_timeout}"
  #encryption_key = "${aws_kms_key.artifact_encryption_key.arn}"

  artifacts {
    type    = "S3"
    location= "${aws_s3_bucket.artifacts.bucket_domain_name}"
    name="exampleA"
    namespace_type="NONE"
    packaging="NONE"
  }

  environment {
    compute_type    = "${var.build_compute_type}"
    image           = "${var.build_image}"
    type            = "LINUX_CONTAINER"
    privileged_mode = "${var.build_privileged_override}"
  }

  source {
    type      = "CODECOMMIT"
    buildspec = "${var.buildspec}"
    location  = "${var.repolocation}"
  }
}
