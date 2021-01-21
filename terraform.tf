terraform {
  backend "remote" {
    organization = "248-sh"

    workspaces {
      name = "workspace-dns"
    }
  }
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  required_version = ">= 0.14"
}
