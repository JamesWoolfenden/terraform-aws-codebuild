variable "organization_name" {}
variable "description" {
  description="Description of the repository"
}

variable "char_delimiter" {}

variable "name" {}

variable "repo_default_branch" {}

variable "force_artifact_destroy" {}

variable "environment" {
  type = "list"
}

variable "build_timeout" {}

variable "artifacts" {
  type = "map"
}

variable "sourcecode" {
  type = "list"
}

variable "common_tags" {
  type = "map"
}
