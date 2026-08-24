output "artifact_bucket" {
  value       = module.codebuild.artifact_bucket
  description = "The S3 bucket holding build artifacts"
}

output "codebuild_role_name" {
  value       = module.codebuild.codebuild_role_name
  description = "The name of the IAM role the CodeBuild project assumes"
}

output "project" {
  value       = module.codebuild.project
  description = "The full CodeBuild project resource created by the module"
}
