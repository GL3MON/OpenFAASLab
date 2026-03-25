terraform {
  required_providers {
    openfaas = {
      source  = "openfaas/openfaas"
      version = ">= 0.1.0"
    }
  }
}

variable "gateway_url" {}
variable "username" {}
variable "password" {}

provider "openfaas" {
  uri      = var.gateway_url
  username = var.username
  password = var.password
}

resource "openfaas_function" "test" {
  name  = "test-fn"
  image = "gl3mon/test-fn:latest"
}