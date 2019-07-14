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

variable "common_tags" {
  type = "map"
}

variable "source_location" {
  type = "string"
}
