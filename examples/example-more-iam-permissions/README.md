# basic-example

This is a basic example of using the `terraform-aws-codecommit` Terraform module, it provides additiona permission to the default role.

## Sample buildspec files

In this example directory there is `buildspec.yml`, 'setlatest.sh' and `buildno.sh`. These are sample build spec files you can add to the root of your new repository in CodeCommit. The shell script calls ssm and increments the build number found at that location it is then made available in the build.
