variable "gateway_url" {}
variable "username" {}
variable "password" {}

provider "openfaas" {
  uri      = var.gateway_url
  username = var.username
  password = var.password
}

resource "openfaas_function" "fn" {
  name  = "test-fn"
  image = "gl3mon/test-fn:latest"
}