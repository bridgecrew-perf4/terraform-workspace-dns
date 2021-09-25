terraform {
  backend "remote" {
    organization = "248-sh"

    workspaces {
      name = "workspace-dns"
    }
  }
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    google = {
      source = "hashicorp/google"
    }
    # namecheap = {
    #   source = "namecheap/namecheap"
    # }
  }
  required_version = ">= 1"
}
