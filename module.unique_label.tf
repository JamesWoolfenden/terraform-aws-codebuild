# Generate a unique label for naming resources
module "unique_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.1"
  namespace  = "${var.organization_name}"
  name       = "${var.reponame}"
  stage      = "${var.environment}"
  delimiter  = "${var.char_delimiter}"
  attributes = []
  tags       = "${map()}"
}
