# Terraform-AWS-Codebuild

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| build\_timeout | The time to wait for a CodeBuild to complete before timing out in minutes (default: 5) | string | n/a | yes |
| common\_tags |  | map | n/a | yes |
| depends\_on | This is a way to make a module depends on, which isnt built to depend on | list | `<list>` | no |
| description | Description of the Codebuild project | string | `""` | no |
| environment | The environment being deployed | list | n/a | yes |
| force\_artifact\_destroy | Force the removal of the artifact S3 bucket on destroy (default: false). | string | n/a | yes |
| name |  | string | n/a | yes |
| region | Which aws region this is in. | string | `"eu-west-1"` | no |
| sourcecode |  | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| artifact\_bucket |  |
| codebuild\_role |  |
| codebuild\_role\_name |  |

�