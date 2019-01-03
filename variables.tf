variable "name" {}

variable "force_artifact_destroy" {
  description = "Force the removal of the artifact S3 bucket on destroy (default: false)."
}

variable "environment" {
  type        = "list"
  description = "The environment being deployed"
}

variable "build_timeout" {
  description = "The time to wait for a CodeBuild to complete before timing out in minutes (default: 5)"
}

variable "region" {
  default     = "eu-west-1"
  description = "Which aws region this is in."
}

variable "artifacts" {
  type = "list"
}

variable "sourcecode" {
  type = "list"
}

variable "common_tags" {
  type = "map"
}
