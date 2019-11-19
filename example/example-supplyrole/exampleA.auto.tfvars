name                   = "example-supplyrole"
projectroot            = "example"
description            = "Description fitting of such a repos"
force_artifact_destroy = "false"
role                   = "LambdaExecutionRole"

sourcecode = {
  type      = "CODECOMMIT"
  location  = "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/exampleA"
  buildspec = ""
}

common_tags = {
  name = "exampleSupplyrole"
}
