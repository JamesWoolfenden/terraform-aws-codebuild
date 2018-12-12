output "artifact_bucket" {
  value = "${aws_s3_bucket.artifacts.id}"
}

output "codebuild_role" {
  value = "${aws_iam_role.codebuild_assume_role.arn}"
}

output "codebuild_role_name" {
  value = "${aws_iam_role.codebuild_assume_role.id}"
}
