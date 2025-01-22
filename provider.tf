terraform {
    //required_version = ""
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">=3.2.0"
        }
    }
}

provider "azurerm" {
     features{}

     subscription_id = "1a03097d-acea-4652-9359-ee20a58c6383"

}