variable "description" {
  description = "Description of the repository"
}

variable "projectroot" {
  description = "The root project name"
}

variable "name" {
  description = "The name of the build pipeline"
}

variable "force_artifact_destroy" {}

variable "build_timeout" {
  description = "Timeout set for the build to run"
}

variable "sourcecode" {
  type = "list"
}

variable "common_tags" {
  type = "map"
}
variable "type" {
  type = "string"
}

variable "environment" {
  type = "list"
}
