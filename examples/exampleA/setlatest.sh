#!/usr/bin/env sh
aws ssm put-parameter --name "/core/codebuild/exampleA/latest" --type "String" --value "$BUILDVERSION" --overwrite
