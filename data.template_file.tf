data "template_file" "buildnumber" {
  template = file("${path.module}/template/buildno.sh.template")

  vars = {
    name        = var.name
    projectroot = var.projectroot
  }
}