#!/usr/bin/env sh

BUILDNUMBER=$(aws ssm get-parameters --name "/core/codebuild/exampleA/buildnumber" --output text --query "Parameters[*].{Value:Value}")
BUILDNUMBER=$(expr $BUILDNUMBER + 1)
export BUILDNUMBER=$BUILDNUMBER
aws ssm put-parameter --name "/core/codebuild/exampleA/buildnumber" --type "String" --value "$BUILDNUMBER" --overwrite
