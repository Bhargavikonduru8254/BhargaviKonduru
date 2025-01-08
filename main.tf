
/*//create new resource group using terraform
resource "azurerm_resource_group" "tpt_batch_01" {
name = "rg-training-tpt-02"
location = "central us"
}

*/

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage_account01" {
  name                     = var.storage_account01_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_account" "storage_account02" {
  name                     = var.storage_account02_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Premium"
  account_replication_type = "ZRS"
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.subnet01
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet01_address_prefixes
  
}


resource "azurerm_subnet" "subnet02" {
  name                 = var.subnet02
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet02_address_prefixes
}


resource "azurerm_subnet" "subnet03" {
  name                 = var.subnet03
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet03_address_prefixes
}

resource "azurerm_private_endpoint" "test" {
  name                = "private_endpoint01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet02.id

  private_service_connection {
    name                           = "private_service_connection01"
    private_connection_resource_id = azurerm_storage_account.storage_account01.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  }

resource "azurerm_private_endpoint" "test1" {
  name                = "private-endpoint02"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet03.id

  private_service_connection {
    name                           = "private_service_connection02"
    private_connection_resource_id = azurerm_storage_account.storage_account02.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  }  
