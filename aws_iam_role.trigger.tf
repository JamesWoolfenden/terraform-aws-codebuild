resource "aws_iam_role" "trigger" {
  path = "/service-role/"

  assume_role_policy = <<PATTERN
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "events.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
PATTERN
}
