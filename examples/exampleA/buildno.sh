#!/usr/bin/env sh

BUILDNUMBER=$(aws ssm get-parameters --name "/core/codebuild/aws-lexbot-wilbur/buildnumber" --output text --query "Parameters[*].{Value:Value}")
BUILDNUMBER=$(expr $BUILDNUMBER + 1)
export BUILDNUMBER=$BUILDNUMBER
aws ssm put-parameter --name "/core/codebuild/aws-lexbot-wilbur/buildnumber" --type "String" --value $BUILDNUMBER --overwrite
