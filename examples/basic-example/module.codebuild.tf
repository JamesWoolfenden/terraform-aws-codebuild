module "codebuild" {
  source                 = "../../"
  reponame               = "${var.reponame}"
  organization_name      = "${var.organization_name}"
  build_image            = "${var.build_image}"
  environment            = "${var.environment}"
  build_timeout          = "${var.build_timeout}"
  build_compute_type     = "${var.build_compute_type}" 
  repolocation           = "${var.repolocation}"
  force_artifact_destroy = true
}
