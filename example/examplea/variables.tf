variable "description" {
  type        = string
  description = "Description of the repository"

  validation {
    condition     = length(var.description) > 0 && length(var.description) <= 255
    error_message = "The description must be between 1 and 255 characters."
  }
}

variable "projectroot" {
  type        = string
  description = "The root project name, used as the leading segment of the SSM parameter paths"

  validation {
    condition     = can(regex("^[A-Za-z0-9_-]{1,128}$", var.projectroot))
    error_message = "The projectroot forms an SSM parameter path segment, so it must be 1-128 characters of letters, numbers, underscores or hyphens with no slashes."
  }
}

variable "force_artifact_destroy" {
  type        = bool
  description = "Force the removal of the artifact S3 bucket on destroy"
}

variable "sourcecode" {
  type        = map(any)
  description = "Describes where the source code comes from, filling the CodeBuild source block"
  default = {
    type      = "CODECOMMIT"
    location  = ""
    buildspec = ""
  }

  validation {
    condition     = contains(["CODECOMMIT", "CODEPIPELINE", "GITHUB", "GITHUB_ENTERPRISE", "BITBUCKET", "S3", "NO_SOURCE"], lookup(var.sourcecode, "type", ""))
    error_message = "The sourcecode type must be one of CODECOMMIT, CODEPIPELINE, GITHUB, GITHUB_ENTERPRISE, BITBUCKET, S3 or NO_SOURCE."
  }
}
