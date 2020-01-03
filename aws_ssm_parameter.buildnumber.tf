resource "aws_ssm_parameter" "buildnumber" {
  name  = "/${var.projectroot}/codebuild/${var.name}/buildnumber"
  type  = "String"
  value = "0"

  # i don't care what it's current value is
  lifecycle {
    ignore_changes = [value]
  }
}
