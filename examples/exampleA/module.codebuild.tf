module "codebuild" {
  source                 = "../../"
  build_timeout          = "${var.build_timeout}"
  name                   = "${var.name}"
  artifacts              = "${var.artifacts}"
  sourcecode             = "${var.sourcecode}"
  common_tags            = "${var.common_tags}"
  environment            = "${var.environment}"
  force_artifact_destroy = "${var.force_artifact_destroy}"
}
