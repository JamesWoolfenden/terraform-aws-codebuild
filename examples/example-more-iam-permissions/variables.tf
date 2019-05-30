variable "description" {
  description = "Description of build project"
  type        = "string"
}

variable "projectroot" {
  description = "The root path element for SSM variables"
  type        = "string"
}

variable "name" {
  description = "The name of the build pipeline"
  type        = "string"
}

variable "force_artifact_destroy" {}

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
  type        = "string"
}

variable "type" {
  type = "string"
}
