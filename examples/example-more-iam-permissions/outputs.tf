output "artifact_bucket" {
  value = "${module.codebuild.artifact_bucket}"
}

output "codebuild_role_name" {
  value = "${module.codebuild.codebuild_role_name}"
}
