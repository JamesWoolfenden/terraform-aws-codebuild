resource "local_file" "buildno" {
  content  = "${data.template_file.buildnumber.rendered}"
  filename = "buildno.sh"
}
