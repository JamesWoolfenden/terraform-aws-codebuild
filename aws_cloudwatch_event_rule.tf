resource "aws_cloudwatch_event_rule" "codechange" {
  name        = "codecommiteventstrigger"
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
        "arn:aws:codecommit:${var.region}:${data.aws_caller_identity.current.account_id}:${var.name}"
    ],
    "source": [
        "aws.codecommit"
    ]
}
PATTERN
}
