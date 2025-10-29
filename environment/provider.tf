terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">=4.0.0"

        }
    }

    backend "azurerm"   {
        resource_group_name  = "bappa-state-rg"
        storage_account_name  = "mstatefiles"
        container_name        = "statefiles"
        key                   = "pro.tfstate"
    }
}

provider "azurerm" {
    features{}
    subscription_id = "70d13209-b5da-483b-9f07-a91b9e1a684b"
  
}