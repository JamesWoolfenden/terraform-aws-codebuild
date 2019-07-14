data "aws_iam_role" "existing" {
  count = "${var.role == "" ? 0 : 1}"
  name  = var.role
}
