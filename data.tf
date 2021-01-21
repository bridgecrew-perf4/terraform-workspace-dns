data "terraform_remote_state" "project" {
  backend = "remote"

  config = {
    organization = "248-sh"
    workspaces = {
      name = "workspace-project"
    }
  }
}
