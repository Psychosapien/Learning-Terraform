terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "=0.1.7"
    }
  }
}
provider "azuredevops" {
  # Remember to specify the org service url and personal access token details below
  org_service_url = "https://dev.azure.com/YOURORGNAME"
  personal_access_token = "YOUR PAT TOKEN"
}

provider "azuread" {
    client_id         = "CLIENT ID FOR SERVICE PRINCIPLE"
    client_secret     = "CLIENT SECRET FOR SERVICE PRINCIPLE - DON'T PUT IT IN HERE THOUGH, USE AN OBSCURED VARIABLE"
    tenant_id         = "TENANT ID FOR SERVICE PRINCIPLE"
}

# Create a project
resource "azuredevops_project" "terraform_ado_project" {
  name       = var.project_name
  description        = var.description
  visibility         = var.visibility
  version_control    = var.version_control

  # Enable or disable whatever features you want for your project
  features = {
      "boards" = "enabled"
      "repositories" = "enabled"
      "pipelines" = "enabled"
      "testplans" = "disabled"
      "artifacts" = "enabled"
  }
}

# Create a repository in that project - if you're into that kind of thing
resource "azuredevops_git_repository" "Repository" {
  project_id = azuredevops_project.terraform_ado_project.id
  name       = var.repo_name
  initialization {
    init_type = "Clean"
  }
}

