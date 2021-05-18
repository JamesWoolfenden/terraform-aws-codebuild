module "codebuild" {
  source                 = "../../"
  common_tags            = var.common_tags
  description            = var.description
  force_artifact_destroy = var.force_artifact_destroy
  name                   = random_string.random.result
  projectroot            = var.projectroot
  sourcecode             = var.sourcecode
}
