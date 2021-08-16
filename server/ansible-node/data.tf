data "template_file" "bootstrap_file" {
  template = file("${path.module}/ansiblenode-bootstrap.txt")
}