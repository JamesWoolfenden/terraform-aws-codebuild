data "template_file" "buildnumber" {
  template = "${file("${path.module}/template/buildno.sh.template")}"
  vars = {
    name = "${var.name}"
    projectroot="${var.projectroot}"
  }
}

resource "local_file" "buildno" {
    content  = "${data.template_file.buildnumber.rendered}"
    filename = "${path.module}/buildno.sh"
}