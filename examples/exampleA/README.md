# basic-example
This is a basic example of using the `terraform-aws-codecommit` Terraform module.

## Sample buildspec files
In this example directory there is `buildspec.yml` and `buildno.sh`. These are sample build spec files you can add to the root of your new repository in CodeCommit. The test buildspec files contains the `artifacts` section that copies the entire repo to the build stage to be used there.
