variable "name" {
  description = "The name of the Build"
  type        = "string"
}

variable "reponame" {
  type        = "string"
  description = "The name of the repository"
  default     = ""
}

variable "force_artifact_destroy" {
  type        = "string"
  description = "Force the removal of the artifact S3 bucket on destroy (default: false)."
}

variable "build_timeout" {
  description = "The time to wait for a CodeBuild to complete before timing out in minutes (default: 5)"
  type        = "string"
  default     = "60"
}

variable "role" {
  description = "Override for providing a role"
  default     = ""
  type        = "string"
}

variable "common_tags" {
  type        = "map"
  description = "An AWS tagging scheme"
}

variable "packaging" {
  description = "To zip or not"
  default     = "NONE"
  type        = "string"
}

variable "namespace_type" {
  description = "Do I want to add a folder to artifact output"
  default     = "NONE"
  type        = "string"
}

variable "projectroot" {
  description = "The name of the parent project for SSM"
  type        = "string"
}

variable "description" {}

variable "encryption_disabled" {
  type        = "string"
  description = "Codebuild will autoencrypt your files"
  default     = false
}

variable "bucketname" {
  default = ""
  type    = "string"
}

variable "region" {
  default = "eu-west-1"
  type    = "string"
}

variable "artifact_type" {
  default = "NO_ARTIFACTS"
  type    = "string"
}

variable "source_type" {
  type    = "string"
  default = "CODECOMMIT"
}

variable "environment_privileged_mode" {
  type    = "string"
  default = "false"
}

variable "environment_type" {
  type    = "string"
  default = "LINUX_CONTAINER"
}

variable "environment_image" {
  type    = "string"
  default = "aws/codebuild/nodejs:6.3.1"
}

variable "environment_compute_type" {
  type    = "string"
  default = "BUILD_GENERAL1_SMALL"
}

variable "source_location" {
  type = "string"
}

variable "defaultbranch" {
  type    = "string"
  default = "master"
}
