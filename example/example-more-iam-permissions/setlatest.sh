#!/usr/bin/env sh
aws ssm put-parameter --name "/core/codebuild/example-more-iam-permissions/latest" --type "String" --value "$BUILDVERSION" --overwrite
