resource "aws_cloudwatch_event_rule" "codechange" {
  count       = var.reponame == "" ? 0 : 1
  name        = "codecommit-${var.name}"
  description = "Capture source code change events to trigger build"

  event_pattern = <<PATTERN
{
    "detail": {
        "referenceName": [
            "master"
        ],
        "referenceType": [
            "branch"
        ]
    },
    "detail-type": [
        "CodeCommit Repository State Change"
    ],
    "resources": [
        "arn:aws:codecommit:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.name}"
    ],
    "source": [
        "aws.codecommit"
    ]
}
PATTERN
}
