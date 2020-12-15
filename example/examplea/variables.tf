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
  type = map(any)
}

variable "sourcecode" {
  type = map(any)
  default = {
    type      = "CODECOMMIT"
    location  = ""
    buildspec = ""
  }
}
