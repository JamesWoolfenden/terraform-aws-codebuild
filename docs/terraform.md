## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| build_timeout | The time to wait for a CodeBuild to complete before timing out in minutes (default: 5) | string | - | yes |
| common_tags | - | map | - | yes |
| depends_on | This is a way to make a module depends on, which isnt built to depend on | list | `<list>` | no |
| description | Description of the Codebuild project | string | `` | no |
| environment | The environment being deployed | list | - | yes |
| force_artifact_destroy | Force the removal of the artifact S3 bucket on destroy (default: false). | string | - | yes |
| name | - | string | - | yes |
| region | Which aws region this is in. | string | `eu-west-1` | no |
| sourcecode | - | list | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| artifact_bucket | - |
| codebuild_role | - |
| codebuild_role_name | - |
