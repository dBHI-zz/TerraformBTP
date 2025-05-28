terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~> 1.12.0"
    }
  }
}

provider "btp" {
  globalaccount = var.globalaccount
}