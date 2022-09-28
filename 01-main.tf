# We will define 
# 1. Terraform Settings Block
# 1. Required Version Terraform
# 2. Required Terraform Providers
# 3. Terraform Remote State Storage with Azure Storage Account (last step of this section)
# 2. Terraform Provider Block for AzureRM
# 3. Terraform Resource Block: Define a Random Pet Resource

# 1. Terraform Settings Block





# Terraform State Storage to Azure Storage Container




# 2. Terraform Provider Block for AzureRM


# 3. Terraform Resource Block: Define a Random Pet Resource



provider "azurerm" {
  subscription_id = "80626432-bbe1-44ec-9382-d16b78c98d91"
  client_id       = "3802ca6e-c0fc-486b-b502-ce0ac4d5fd2d"
  client_secret   = "VsG8Q~_b-VHHXCspf3dKD5DzRUaGPVSiE474tb3g"
  tenant_id       = "c31aaa24-6f54-4e7f-8ed8-52f1fcba33e7"




  features {
  }
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.8.0"
      
    }
    azuread={
      source = "hashicorp/azuread"
      version = "2.28.1"
    }
  }

   
}


 



/*

  backend "azurerm" {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstatexlrwdrzs"
    container_name        = "tfstatefiles"
    key                   = "dev.terraform.tfstate"
  }  
  

  */


resource "random_pet" "aksrandom" {

}

