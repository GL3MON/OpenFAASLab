variable "gateway_url" {}
variable "username" {}
variable "password" {}

resource "null_resource" "deploy" {
  provisioner "local-exec" {
    command = <<EOT
echo "${var.password}" | faas-cli login \
  --username ${var.username} \
  --password-stdin \
  --gateway ${var.gateway_url}

faas-cli deploy -f stack.yml --gateway ${var.gateway_url}
EOT
  }
}

resource "null_resource" "destroy" {
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
echo "${var.password}" | faas-cli login \
  --username ${var.username} \
  --password-stdin \
  --gateway ${var.gateway_url}

faas-cli remove test-fn --gateway ${var.gateway_url}
EOT
  }
}