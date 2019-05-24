#!/usr/bin/env sh

BUILDNUMBER=$(BUILDNUMBER + 1)
export BUILDNUMBER=$BUILDNUMBER
aws ssm put-parameter --name "/core/codebuild/example-more-iam-permissions/buildnumber" --type "String" --value "$BUILDNUMBER"--overwrite
