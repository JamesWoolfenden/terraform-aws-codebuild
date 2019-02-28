resource "aws_iam_role_policy" "codebuild_policy" {
  count = "${var.role == "" ? 1 : 0}"
  role  = "${aws_iam_role.codebuild.id}"

  policy = <<JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "codecommit:GetTree",
                "codecommit:ListPullRequests",
                "codecommit:GetBlob",
                "codecommit:GetReferences",
                "codecommit:GetCommentsForComparedCommit",
                "codecommit:GetCommit",
                "codecommit:GetComment",
                "codecommit:GetCommitHistory",
                "codecommit:GetCommitsFromMergeBase",
                "codecommit:DescribePullRequestEvents",
                "codecommit:GetPullRequest",
                "codecommit:ListBranches",
                "codecommit:GetRepositoryTriggers",
                "codecommit:GitPull",
                "codecommit:BatchGetRepositories",
                "codecommit:GetCommentsForPullRequest",
                "codecommit:GetObjectIdentifier",
                "codecommit:CancelUploadArchive",
                "codecommit:GetFolder",
                "codecommit:BatchGetPullRequests",
                "codecommit:GetFile",
                "codecommit:GetUploadArchiveStatus",
                "codecommit:GetDifferences",
                "codecommit:GetRepository",
                "codecommit:GetBranch",
                "codecommit:GetMergeConflicts"
            ],
            "Resource": "arn:aws:codecommit:${var.region}:${data.aws_caller_identity.current.account_id}:${var.reponame}"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ssm:PutParameter",
                "logs:CreateLogStream",
                "ssm:GetParameters",
                "logs:CreateLogGroup",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.name}-${data.aws_caller_identity.current.account_id}-artifacts",
                "arn:aws:s3:::${var.name}-${data.aws_caller_identity.current.account_id}-artifacts/*"
            ]
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": "codebuild:*",
            "Resource": "arn:aws:codebuild:${var.region}:${data.aws_caller_identity.current.account_id}:project/${var.reponame}"
        }
    ]
}
JSON
}
