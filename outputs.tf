output "artifact_bucket" {
  value = "${aws_s3_bucket.artifacts.0.id}"
}

output "codebuild_role" {
  value = "${var.role == "" ? element(concat(aws_iam_role.codebuild.*.arn, list("")), 0)  : element(concat(data.aws_iam_role.existing.*.arn, list("")), 0) }"
}

output "codebuild_role_name" {
  value = "${var.role == "" ? element(concat(aws_iam_role.codebuild.*.id, list("")), 0) : var.role }"
}
