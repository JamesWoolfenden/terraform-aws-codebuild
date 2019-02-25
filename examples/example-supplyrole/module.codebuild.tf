module "codebuild" {
  source                 = "../../"
  build_timeout          = "${var.build_timeout}"
  common_tags            = "${var.common_tags}"
  description            = "${var.description}"
  environment            = "${var.environment}"
  force_artifact_destroy = "${var.force_artifact_destroy}"
  name                   = "${var.name}"
  projectroot            = "${var.projectroot}"
  role                   = "${var.role}"
  sourcecode             = "${var.sourcecode}"
  env                    = "${var.env}"
}
