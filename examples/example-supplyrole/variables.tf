variable "description" {
  description = "Description of the repository"
}

variable "name" {
  description = "The name of the build pipeline"
}

variable "projectroot" {
  type = "string"
}

variable "force_artifact_destroy" {
  type = "string"
}

variable "role" {
  type = "string"
}

variable "environment" {
  type = "list"
}

variable "build_timeout" {
  description = "Timeout set for the build to run"
}

variable "sourcecode" {
  type = "list"
}

variable "common_tags" {
  type = "map"
}

variable "env" {
  description = "environment name for ssm"
}
