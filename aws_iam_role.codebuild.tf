resource "aws_iam_role" "codebuild" {
  name  = "codebuildrole-${var.name}"
  count = "${var.role == "" ? 1 : 0}"

  assume_role_policy = <<HERE
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codebuild.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
HERE

  tags = var.common_tags
}
