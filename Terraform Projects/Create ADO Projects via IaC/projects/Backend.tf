terraform {
  backend "azurerm" {
    resource_group_name  = "RESOURCE GROUP FOR STORAGE ACCOUNT"
    storage_account_name = "STORAGE ACCOUNT NAME"
    container_name       = "STORAGE CONTAINER NAME"
    sas_token            = "SAS TOKEN FOR YOUR CONTAINER"
  }
}
