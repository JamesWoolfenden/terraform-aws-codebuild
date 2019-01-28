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

variable "environment" {
  type = "list"
}

variable "build_timeout" {}

variable "sourcecode" {
  type = "list"
}

variable "common_tags" {
  type = "map"
}
