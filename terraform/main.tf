variable "gateway_url" {}
variable "username" {}
variable "password" {}

resource "openfaas_function" "test" {
  name  = "test-fn"
  image = "gl3mon/test-fn:latest"
}