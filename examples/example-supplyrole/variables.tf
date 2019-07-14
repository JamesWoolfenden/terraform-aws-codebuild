variable "description" {
  description = "Description of the repository"
}


variable "projectroot" {
  description = "The root project name"
}

variable "role" {
  type = "string"
}

variable "name" {
  description = "The name of the build pipeline"
}

variable "force_artifact_destroy" {}


variable "common_tags" {
  type = map
}

variable "source_location" {
  type=string
}
