data "template_file" "latest" {
  template = "${file("${path.module}/template/setlatest.sh.template")}"

  vars = {
    name        = "${var.name}"
    projectroot = "${var.projectroot}"
    env         = "${var.env}"
  }
}

resource "local_file" "latest" {
  content  = "${data.template_file.latest.rendered}"
  filename = "setlatest.sh"
}
