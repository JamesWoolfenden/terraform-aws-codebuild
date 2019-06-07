output "artifact_bucket" {
  value = "${local.bucketname}"
}

output "codebuild_role_name" {
  value = "${var.role == "" ? element(concat(aws_iam_role.codebuild.*.id, list("")), 0) : var.role}"
}
