data "template_file" "buildspec" {
  template = "${file("${path.module}/template/buildspec.yml.template")}"

  vars = {
    name        = "${var.name}"
    projectroot = "${var.projectroot}"
    env         = "${var.env}"
  }
}

resource "local_file" "buildspec" {
  content  = "${data.template_file.buildspec.rendered}"
  filename = "buildspec.yml"

  lifecycle {
    ignore_changes = true
  }
}
