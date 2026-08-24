output "artifact_bucket" {
  value       = local.bucketname
  description = "The Bucket for Artifacts"
}

output "codebuild_role_name" {
  value       = var.role == "" ? one(aws_iam_role.codebuild[*].id) : var.role
  description = "The name of the IAM role CodeBuild assumes, either the role created by this module or the override supplied in var.role"
}

output "project" {
  value       = aws_codebuild_project.build
  description = "The full aws_codebuild_project resource, exposed so callers can reference its arn, id, and badge_url"
}
