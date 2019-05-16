## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucketname | - | string | `` | no |
| build_timeout | The time to wait for a CodeBuild to complete before timing out in minutes (default: 5) | string | - | yes |
| common_tags | An AWS tagging scheme | map | - | yes |
| depends_on | This is a way to make a module depends on, which isnt built to depend on | list | `<list>` | no |
| description | - | string | - | yes |
| encryption_disabled | Codebuild will autoencrypt your files | string | `false` | no |
| environment | The environment being deployed | list | - | yes |
| force_artifact_destroy | Force the removal of the artifact S3 bucket on destroy (default: false). | string | - | yes |
| name | The name of the Build | string | - | yes |
| namespace_type | Do I want to add a folder to artifact output | string | `NONE` | no |
| packaging | To zip or not | string | `NONE` | no |
| projectroot | The name of the parent project for SSM | string | - | yes |
| region | Which aws region this is in. | string | `eu-west-1` | no |
| reponame | The name of the repository | string | `` | no |
| role | Override for providing a role | string | `` | no |
| sourcecode | The SourceCode | list | - | yes |
| type | - | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| artifact_bucket | - |
| codebuild_role | - |
| codebuild_role_name | - |

