variable "gateway_url" {}
variable "username" {}
variable "password" {}
variable "action" {}

resource "null_resource" "deploy" {
  count = var.action == "deploy" ? 1 : 0

  provisioner "local-exec" {
    command = <<EOT
echo "${var.password}" | faas-cli login \
  --username ${var.username} \
  --password-stdin \
  --gateway ${var.gateway_url}

faas-cli deploy -f ${path.root}/../stack.yml --gateway ${var.gateway_url}
EOT
  }
}

resource "null_resource" "destroy" {
  count = var.action == "destroy" ? 1 : 0

  provisioner "local-exec" {
    command = <<EOT
echo "${var.password}" | faas-cli login \
  --username ${var.username} \
  --password-stdin \
  --gateway ${var.gateway_url}

faas-cli remove test-fn --gateway ${var.gateway_url}
EOT
  }
}