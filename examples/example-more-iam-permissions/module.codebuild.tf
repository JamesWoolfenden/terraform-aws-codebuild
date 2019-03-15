module "codebuild" {
  source                 = "../../"
  build_timeout          = "${var.build_timeout}"
  common_tags            = "${var.common_tags}"
  description            = "${var.description}"
  env                    = "${var.env}"
  environment            = "${var.environment}"
  force_artifact_destroy = "${var.force_artifact_destroy}"
  name                   = "${var.name}"
  projectroot            = "${var.projectroot}"
  sourcecode             = "${var.sourcecode}"
  type                   = "${var.type}"
}
