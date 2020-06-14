variable "description" {
  type        = string
  description = "Description of the repository"
}

variable "projectroot" {
  type        = string
  description = "The root project name"
}

variable "force_artifact_destroy" {
  type = string
}

variable "common_tags" {
  type = map
}

variable "sourcecode" {
  type = map
  default = {
    type      = "CODECOMMIT"
    location  = ""
    buildspec = ""
  }
}
