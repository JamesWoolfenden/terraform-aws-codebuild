variable "name" {
  description = "The name of the Build"
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9._-]{2,255}$", var.name))
    error_message = "The name must be 2-255 characters of letters, numbers, dots, underscores or hyphens; dots are replaced with hyphens for the CodeBuild project name."
  }
}

variable "reponame" {
  type        = string
  description = "The name of the repository"
  default     = ""

  validation {
    condition     = var.reponame == "" || can(regex("^[A-Za-z0-9._-]{1,100}$", var.reponame))
    error_message = "The reponame must be empty (no CodeCommit trigger) or a valid CodeCommit repository name of up to 100 characters."
  }
}

variable "force_artifact_destroy" {
  type        = bool
  description = "Force the removal of the artifact S3 bucket on destroy (default: false)."
  default     = false
}

variable "build_timeout" {
  description = "The time to wait for a CodeBuild to complete before timing out in minutes (default: 30)"
  type        = number
  default     = 30

  validation {
    condition     = var.build_timeout >= 5 && var.build_timeout <= 480
    error_message = "The build_timeout must be between 5 and 480 minutes, the range AWS CodeBuild accepts."
  }
}

variable "role" {
  description = "Override for providing a role"
  default     = ""
  type        = string

  validation {
    condition     = var.role == "" || can(regex("^[A-Za-z0-9+=,.@_-]{1,64}$", var.role))
    error_message = "The role must be empty (this module creates the role) or an existing IAM role name of up to 64 characters, not an ARN."
  }
}

variable "artifact" {
  description = "Populates the Artifact block"
  type        = map(string)
  default = {
    packaging      = "NONE"
    namespace_type = "NONE"
  }

  validation {
    condition     = contains(["NONE", "ZIP"], lookup(var.artifact, "packaging", "NONE")) && contains(["NONE", "BUILD_ID"], lookup(var.artifact, "namespace_type", "NONE"))
    error_message = "The artifact packaging must be NONE or ZIP, and namespace_type must be NONE or BUILD_ID."
  }
}

variable "projectroot" {
  description = "The name of the parent project for SSM"
  type        = string
  default     = "core"

  validation {
    condition     = can(regex("^[A-Za-z0-9_-]{1,128}$", var.projectroot))
    error_message = "The projectroot forms an SSM parameter path segment, so it must be 1-128 characters of letters, numbers, underscores or hyphens with no slashes."
  }
}

variable "description" {
  description = "The description applied to the CodeBuild project"
  type        = string
  default     = ""

  validation {
    condition     = length(var.description) <= 255
    error_message = "The description must be 255 characters or fewer, the CodeBuild project description limit."
  }
}

variable "bucketname" {
  description = "Existing S3 bucket to use for artifacts; leave empty to have this module create one"
  type        = string
  default     = ""

  validation {
    condition     = var.bucketname == "" || can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucketname))
    error_message = "The bucketname must be empty (this module creates the bucket) or a valid S3 bucket name: 3-63 lowercase characters, starting and ending alphanumeric."
  }
}

variable "defaultbranch" {
  description = "The default git branch"
  type        = string
  default     = "master"

  validation {
    condition     = can(regex("^[^ ~^:?*]+$", var.defaultbranch))
    error_message = "The defaultbranch must be a valid git branch name, with none of the characters git forbids: space ~ ^ : ? or *."
  }
}

variable "environment" {
  description = "A map to describe the build environment and populate the environment block"
  type        = map(any)
  default = {
    privileged_mode = "false"
    type            = "LINUX_CONTAINER"
    image           = "aws/codebuild/standard:7.0"
    compute_type    = "BUILD_GENERAL1_SMALL"
  }

  validation {
    condition = alltrue([
      contains(["BUILD_GENERAL1_SMALL", "BUILD_GENERAL1_MEDIUM", "BUILD_GENERAL1_LARGE", "BUILD_GENERAL1_2XLARGE", "BUILD_LAMBDA_1GB", "BUILD_LAMBDA_2GB", "BUILD_LAMBDA_4GB", "BUILD_LAMBDA_8GB", "BUILD_LAMBDA_10GB"], lookup(var.environment, "compute_type", "BUILD_GENERAL1_SMALL")),
      contains(["LINUX_CONTAINER", "LINUX_GPU_CONTAINER", "WINDOWS_SERVER_2019_CONTAINER", "ARM_CONTAINER", "LINUX_LAMBDA_CONTAINER", "ARM_LAMBDA_CONTAINER"], lookup(var.environment, "type", "LINUX_CONTAINER")),
      lookup(var.environment, "image", "") != "",
    ])
    error_message = "The environment must set a non-empty image, a compute_type that is a valid BUILD_GENERAL1 or BUILD_LAMBDA size, and a type that is a valid CodeBuild environment type."
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

  validation {
    condition     = contains(["CODECOMMIT", "CODEPIPELINE", "GITHUB", "GITHUB_ENTERPRISE", "BITBUCKET", "S3", "NO_SOURCE"], lookup(var.sourcecode, "type", ""))
    error_message = "The sourcecode type must be one of CODECOMMIT, CODEPIPELINE, GITHUB, GITHUB_ENTERPRISE, BITBUCKET, S3 or NO_SOURCE."
  }
}

variable "sse_algorithm" {
  description = "The type of encryption algorithm to use"
  type        = string
  default     = "aws:kms"

  validation {
    condition     = contains(["aws:kms", "aws:kms:dsse", "AES256"], var.sse_algorithm)
    error_message = "The sse_algorithm must be one of aws:kms, aws:kms:dsse or AES256."
  }
}

variable "encryption_disabled" {
  description = "Disable the encryption of artifacts"
  type        = bool
  default     = false

  validation {
    condition     = can(tobool(var.encryption_disabled))
    error_message = "The encryption_disabled must be a boolean."
  }
}

variable "artifact_type" {
  description = "The Artifact type, S3, CODEPIPELINE or NO_ARTIFACT"
  type        = string
  default     = "S3"

  validation {
    condition     = contains(["S3", "CODEPIPELINE", "NO_ARTIFACTS"], var.artifact_type)
    error_message = "The artifact_type must be one of S3, CODEPIPELINE or NO_ARTIFACTS."
  }
}

variable "artifact_expiry" {
  type        = number
  default     = 365
  description = "The number of days after which build artifacts expire from the artifact bucket"

  validation {
    condition     = var.artifact_expiry > 0 && var.artifact_expiry == floor(var.artifact_expiry)
    error_message = "The artifact_expiry must be a whole number of days greater than zero."
  }
}

variable "artifact_noncurrent_expiry" {
  type        = number
  default     = 30
  description = "The number of days after which noncurrent (superseded) artifact versions are deleted. Prior versions exist to recover from a bad overwrite, so this is normally much shorter than artifact_expiry."

  validation {
    condition     = var.artifact_noncurrent_expiry > 0 && var.artifact_noncurrent_expiry == floor(var.artifact_noncurrent_expiry)
    error_message = "The artifact_noncurrent_expiry must be a whole number of days greater than zero."
  }
}

variable "cache_type" {
  type        = string
  default     = "LOCAL"
  description = "CodeBuild cache type: LOCAL, S3 or NO_CACHE"

  validation {
    condition     = contains(["LOCAL", "S3", "NO_CACHE"], var.cache_type)
    error_message = "The cache_type must be one of LOCAL, S3 or NO_CACHE."
  }
}

variable "cache_modes" {
  type        = list(string)
  default     = ["LOCAL_SOURCE_CACHE", "LOCAL_CUSTOM_CACHE"]
  description = "Cache modes used when cache_type is LOCAL. Ignored for S3 and NO_CACHE."

  validation {
    condition     = alltrue([for m in var.cache_modes : contains(["LOCAL_SOURCE_CACHE", "LOCAL_DOCKER_LAYER_CACHE", "LOCAL_CUSTOM_CACHE"], m)])
    error_message = "Each cache mode must be one of LOCAL_SOURCE_CACHE, LOCAL_DOCKER_LAYER_CACHE or LOCAL_CUSTOM_CACHE."
  }
}

variable "versioning" {
  type        = string
  description = "Set bucket to version"
  default     = "Enabled"

  validation {
    condition     = contains(["Enabled", "Suspended"], var.versioning)
    error_message = "The versioning must be Enabled or Suspended."
  }
}

variable "mfa_delete" {
  type        = string
  description = "Require MFA to delete"
  default     = "Disabled"

  validation {
    condition     = contains(["Enabled", "Disabled"], var.mfa_delete)
    error_message = "The mfa_delete must be Enabled or Disabled."
  }
}

variable "kms_key_id" {
  type        = string
  description = "Your Custom KMS key"
  default     = ""

  validation {
    condition     = var.kms_key_id == "" || can(regex("^(arn:aws[a-z-]*:kms:|alias/|[0-9a-f]{8}-)", var.kms_key_id))
    error_message = "The kms_key_id must be empty, a KMS key ARN, an alias/ name, or a bare key UUID."
  }
}

variable "logs_bucket" {
  type        = string
  description = "The bucket id and path for storing the logs. This bucket also receives S3 server access logs for the artifact bucket, so it must not be encrypted with SSE-KMS unless a bucket key is enabled — S3 log delivery cannot write to an SSE-KMS bucket without one."

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9](/.*)?$", var.logs_bucket))
    error_message = "The logs_bucket must be an S3 bucket name optionally followed by a path, for example my-logs-bucket/codebuild/."
  }
}
