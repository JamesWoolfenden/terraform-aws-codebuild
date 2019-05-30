module "codebuild" {
  source                 = "../../"
  common_tags            = "${var.common_tags}"
  description            = "${var.description}"
  force_artifact_destroy = "${var.force_artifact_destroy}"
  name                   = "${var.name}"
  projectroot            = "${var.projectroot}"
}
