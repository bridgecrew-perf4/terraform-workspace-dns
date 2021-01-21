provider "google" {
  alias = "this"

  credentials = base64decode(data.terraform_remote_state.project.outputs.google_service_account_key.this.private_key)
  project     = data.terraform_remote_state.project.outputs.google_project.this.project_id
}
