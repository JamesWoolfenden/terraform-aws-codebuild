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
  type        = map(any)
  description = "An AWS tagging scheme"
}


variable "artifact" {
  description = "Populates the Artifact block"
  default = {
    packaging      = "NONE"
    namespace_type = "NONE"
  }
}

variable "projectroot" {
  description = "The name of the parent project for SSM"
  type        = string
  default     = "core"
}

variable "description" {
  description = "Yeah it's the description"
  type        = string
  default     = ""
}

variable "bucketname" {
  description = ""
  default     = ""
  type        = string
}

variable "defaultbranch" {
  description = "The default git branch"
  type        = string
  default     = "master"
}

variable "environment" {
  description = "A map to describe the build environment and populate the environment block"
  type        = map(any)
  default = {
    privileged_mode = "false"
    type            = "LINUX_CONTAINER"
    image           = "aws/codebuild/nodejs:6.3.1"
    compute_type    = "BUILD_GENERAL1_SMALL"
  }
}


variable "sourcecode" {
  description = "A map to describe where your sourcecode comes from, to fill the sourcecode block in a Codebuild project "
  type        = map(any)
  default = {
    type      = "CODECOMMIT"
    location  = ""
    buildspec = ""
  }
}

variable "sse_algorithm" {
  description = "The type of encryption algorithm to use"
  type        = string
  default     = "aws:kms"
}


variable "encryption_disabled" {
  description = "Disable the encryption of artifacts"
  type        = bool
  default     = false
}

variable "artifact_type" {
  description = "The Artifact type, S3, CODEPIPELINE or NO_ARTIFACT"
  type        = string
  default     = "S3"
}

variable "versioning" {
  type        = bool
  description = "Set bucket to version"
  default     = false
}

variable "mfa_delete" {
  type        = bool
  description = "Require MFA to delete"
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "Your Custom KMS key"
  default     = ""
}
