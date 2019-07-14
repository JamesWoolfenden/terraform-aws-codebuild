# Terraform import

terraform import module.codebuild.aws_codebuild_project.project test-terraform
terraform import module.codebuild.aws_ssm_parameter.buildnumber /core/codebuild/aws-lexbot-handler/buildnumber
