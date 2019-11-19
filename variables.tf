variable "name" {
  description = "The name of the Build"
  type        = string
}

variable "reponame" {
  type        = string
  description = "The name of the repository"
  default     = ""
}

variable "force_artifact_destroy" {
  type        = string
  description = "Force the removal of the artifact S3 bucket on destroy (default: false)."
  default     = false
}

variable "build_timeout" {
  description = "The time to wait for a CodeBuild to complete before timing out in minutes (default: 5)"
  type        = string
  default     = "60"
}

variable "role" {
  description = "Override for providing a role"
  default     = ""
  type        = string
}

variable "common_tags" {
  type        = map
  description = "An AWS tagging scheme"
}


variable "artifact" {
  default = {
    encryption_disabled = false
    packaging           = "NONE"
    type                = "NO_ARTIFACTS"
    namespace_type      = "NONE"
  }
}

variable "projectroot" {
  description = "The name of the parent project for SSM"
  type        = string
  default     = "core"
}

variable "description" {
  type    = string
  default = ""
}


variable "bucketname" {
  default = ""
  type    = string
}

variable "defaultbranch" {
  type    = string
  default = "master"
}

variable "environment" {
  type = map
  default = {
    privileged_mode = "false"
    type            = "LINUX_CONTAINER"
    image           = "aws/codebuild/nodejs:6.3.1"
    compute_type    = "BUILD_GENERAL1_SMALL"
  }
}


variable "sourcecode" {
  type = map
  default = {
    type      = "CODECOMMIT"
    location  = ""
    buildspec = ""
  }
}
