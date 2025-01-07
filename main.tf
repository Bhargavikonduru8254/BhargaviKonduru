
/*//create new resource group using terraform
resource "azurerm_resource_group" "tpt_batch_01" {
name = "rg-training-tpt-02"
location = "central us"
}

*/

resource "azurerm_resource_group" "test" {
  name     = "test-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "test" {
  name                     = "teststgaccount"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_account" "test1" {
  name                     = "teststgaccount2"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Premium"
  account_replication_type = "ZRS"
}

resource "azurerm_virtual_network" "test" {
  name                = "virtnetname"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_subnet" "subnet01" {
  name                 = "subnetname"
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_subnet" "subnet02" {
  name                 = "subnetname2"
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = ["10.0.3.0/24"]
}


resource "azurerm_subnet" "subnet03" {
  name                 = "subnetname3"
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_private_endpoint" "test" {
  name                = "example-endpoint"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  subnet_id           = azurerm_subnet.subnet02.id

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.test.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  }

resource "azurerm_private_endpoint" "test1" {
  name                = "example-endpoint"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  subnet_id           = azurerm_subnet.subnet03.id

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.test1.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  }  
