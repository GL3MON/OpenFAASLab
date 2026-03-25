terraform {
  required_providers {
    openfaas = {
      source  = "openfaas/openfaas"
      version = ">= 0.1.0"
    }
  }
}

provider "openfaas" {
  uri      = var.gateway_url
  username = var.username
  password = var.password
}