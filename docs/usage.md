## Detailed Notes
These template inplment the module terraform-aws-codebuild. It includes a number of default behaviours.

### Sample buildspec files
In this example directory there is `buildspec.yml` and `buildno.sh`. These are starter build spec files you can add to the root of your new repository in CodeCommit. The `buildno.sh` shell script calls ssm and increments the build number found at that location it is then made available in the build process itself.
