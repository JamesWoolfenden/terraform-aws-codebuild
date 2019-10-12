[![Slalom][logo]](https://slalom.com)

# terraform-aws-codebuild [![Build Status](https://api.travis-ci.com/JamesWoolfenden/terraform-aws-codebuild.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-codebuild) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-codebuild.svg)](https://github.com/JamesWoolfenden/terraform-aws-codebuild/releases/latest)

Terraform module to provision an AWS [`codebuild`](https://aws.amazon.com/codebuild/) CI/CD system.

When to use Codebuild:
If you want to stay with AWS, or when you are using ECR, Codepipeline or CodeCommit.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "codebuild" {
  source                 = "jameswoolfenden/codebuild/aws"
  build_timeout          = var.build_timeout
  common_tags            = var.common_tags
  description            = var.description
  environment            = var.environment
  force_artifact_destroy = var.force_artifact_destroy
  name                   = var.name
  namespace_type         = var.namespace_type
  packaging              = var.packaging
  projectroot            = var.projectroot
  reponame               = var.reponame
  sourcecode             = var.sourcecode
  type                   = var.type
}

As always a full example is included for reference.
```

## Detailed Notes

These templates inplement the module terraform-aws-codebuild. It includes a number of defaulted behaviours.

### Sample buildspec files

In the root directory there is an example `buildspec.yml`. This is a build spec you can supply to CodeCommit. It includes some basic codebuild functionality to drive semantic versioning using SSM parameters.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artifact\_type |  | string
 | `"NO_ARTIFACTS"` | no |
| bucketname |  | string
 | `""` | no |
| build\_timeout | The time to wait for a CodeBuild to complete before timing out in minutes (default: 5) | string
 | `"60"` | no |
| common\_tags | An AWS tagging scheme | map
 | n/a | yes |
| defaultbranch |  | string
 | `"master"` | no |
| description |  | string
 | `""` | no |
| encryption\_disabled | Codebuild will autoencrypt your files | string
 | `"false"` | no |
| environment\_compute\_type |  | string
 | `"BUILD_GENERAL1_SMALL"` | no |
| environment\_image |  | string
 | `"aws/codebuild/nodejs:6.3.1"` | no |
| environment\_privileged\_mode |  | string
 | `"false"` | no |
| environment\_type |  | string
 | `"LINUX_CONTAINER"` | no |
| force\_artifact\_destroy | Force the removal of the artifact S3 bucket on destroy (default: false). | string
 | `"false"` | no |
| name | The name of the Build | string
 | n/a | yes |
| namespace\_type | Do I want to add a folder to artifact output | string
 | `"NONE"` | no |
| packaging | To zip or not | string
 | `"NONE"` | no |
| projectroot | The name of the parent project for SSM | string
 | `"core"` | no |
| reponame | The name of the repository | string
 | `""` | no |
| role | Override for providing a role | string
 | `""` | no |
| source\_buildspec |  | string
 | `""` | no |
| source\_location |  | string
 | n/a | yes |
| source\_type |  | string
 | `"CODECOMMIT"` | no |

## Outputs

| Name | Description |
|------|-------------|
| artifact\_bucket |  |
| codebuild\_role\_name |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-codebuild/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-codebuild/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-codebuild&url=https://github.com/jameswoolfenden/terraform-aws-codebuild
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-codebuild&url=https://github.com/jameswoolfenden/terraform-aws-codebuild
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-codebuild
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-codebuild
[share_email]: mailto:?subject=terraform-aws-codebuild&body=https://github.com/jameswoolfenden/terraform-aws-codebuild
