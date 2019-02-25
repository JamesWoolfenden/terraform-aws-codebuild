#!/usr/bin/env sh

BUILDNUMBER=$(aws ssm get-parameters --name "/core/codebuild/example-more-iam-permissions/buildnumber" --output text --query "Parameters[*].{Value:Value}")
BUILDNUMBER=$((BUILDNUMBER + 1))
export BUILDNUMBER=$BUILDNUMBER
aws ssm put-parameter --name "/core/codebuild/example-more-iam-permissions/buildnumber" --type "String" --value "$BUILDNUMBER"--overwrite
