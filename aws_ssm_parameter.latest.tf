resource "aws_ssm_parameter" "latest" {
  # checkov:skip=CKV2_AWS_34: ADD REASON
  name  = "/${var.projectroot}/codebuild/${var.name}/latest"
  type  = "String"
  value = "0"


  # i don't care what it's current value is
  lifecycle {
    ignore_changes = [value]
  }
}
