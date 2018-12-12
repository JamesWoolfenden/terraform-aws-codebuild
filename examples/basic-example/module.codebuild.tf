module "codebuild" {
  source                 = "../../"
  repo_name              = "${var.repo_name}"
  organization_name      = "${var.organization_name}"
  build_image            = "${var.build_image}"
  environment            = "${var.environment}"
  build_timeout          = "${var.build_timeout}"
  build_compute_type     = "${var.build_compute_type}" 
  force_artifact_destroy = true
}
