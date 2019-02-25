variable "description" {
  description = "Description of build project"
}

variable "projectroot" {
  description = "The root path element for SSM variables"
}

variable "name" {
  description = "The name of the build pipeline"
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
