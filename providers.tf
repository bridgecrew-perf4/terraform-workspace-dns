provider "digitalocean" {
  token = data.terraform_remote_state.project.outputs.digitalocean_token
}

provider "google" {
  alias = "this"

  credentials = base64decode(data.terraform_remote_state.project.outputs.google_service_account_key.this.private_key)
  project     = data.terraform_remote_state.project.outputs.google_project.this.project_id
}

# provider "namecheap" {
#   user_name   = "lalala"
#   api_user    = "lalala"
#   api_key     = "lalala"
#   client_ip   = "wat"
#   use_sandbox = false
# }
