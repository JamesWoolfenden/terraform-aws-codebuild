#!/usr/bin/env sh

BUILDNUMBER=$(BUILDNUMBER + 1)
export BUILDNUMBER=$BUILDNUMBER
aws ssm put-parameter --name "/core/codebuild/exampleA/buildnumber" --type "String" --value "$BUILDNUMBER" --overwrite
