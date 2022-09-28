
data "azuread_domains" "azure_domain" {
  only_initial = true
}


resource "azuread_application" "azure_application" {
  display_name = "demoapp"
}


resource "azuread_service_principal" "azure_Service_principle_demo" {
  application_id = azuread_application.azure_application.application_id
}





data "azuread_client_config" "current" {
  
}

resource "time_rotating" "timerotate" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "service_principal_password" {
  service_principal_id = azuread_service_principal.azure_Service_principle_demo.object_id
  rotate_when_changed = {
    rotation = time_rotating.timerotate.id
  }
}

resource "azuread_group" "aks_administrators" {
  display_name      = "cluster-administrators"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_user" "azure_user" {
  user_principal_name = "ExampleUser@${data.azuread_domains.azure_domain.domains.0.domain_name}"
  display_name        = "cluster_user"
  password            = "admin@1234"
}




