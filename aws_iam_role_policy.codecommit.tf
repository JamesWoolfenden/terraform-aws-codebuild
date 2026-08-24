resource "aws_iam_role_policy" "codecommit" {
  name = "codecommit-${var.name}"
  # Gated on BOTH conditions. aws_iam_role.codebuild exists only when this
  # module creates the role, so counting on reponame alone made this policy
  # index an empty collection whenever a caller supplied their own role and a
  # repo together, failing the plan outright. Matching the gate on
  # aws_iam_role_policy.codebuild also keeps the module's convention: it
  # manages permissions only on roles it owns.
  count = var.role == "" && var.reponame != "" ? 1 : 0
  role  = aws_iam_role.codebuild[0].id

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
            "Resource": "arn:aws:codecommit:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:${var.reponame}"
        }
    ]
}
JSON
}
