variable "name" {
  description = "The name of the Build"
}

variable "reponame" {
  type        = "string"
  description = "The name of the repository"
  default     = ""
}

variable "force_artifact_destroy" {
  type        = "string"
  description = "Force the removal of the artifact S3 bucket on destroy (default: false)."
}

variable "environment" {
  type        = "list"
  description = "The environment being deployed"
}

variable "build_timeout" {
  description = "The time to wait for a CodeBuild to complete before timing out in minutes (default: 5)"
}

variable "type" {
  type = "string"
}

variable "sourcecode" {
  type        = "list"
  description = "The SourceCode"
}

variable "role" {
  description = "Override for providing a role"
  default     = ""
  type        = "string"
}

variable "common_tags" {
  type        = "map"
  description = "An AWS tagging scheme"
}

variable "packaging" {
  description = "To zip or not"
  default     = "NONE"
}

variable "namespace_type" {
  description = "Do I want to add a folder to artifact output"
  default     = "NONE"
}

variable "projectroot" {
  description = "The name of the parent project for SSM"
}

variable depends_on {
  default     = []
  description = "This is a way to make a module depends on, which isnt built to depend on"
  type        = "list"
}

variable "description" {}

variable "encryption_disabled" {
  type        = "string"
  description = "Codebuild will autoencrypt your files"
  default     = false
}

variable "bucketname" {
  default = ""
}
