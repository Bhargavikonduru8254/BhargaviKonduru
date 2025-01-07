
//create new resource group using terraform
resource "azurerm_resource_group" "tpt_batch_01" {
name = "rg-training-tpt-02"
location = "central us"
}

# Virtual Network
resource "azurerm_virtual_network" "dev_virtual_network_01" {
name                =var.vnet_name
resource_group_name = azurerm_resource_group.tpt_batch_01.name
location            = azurerm_resource_group.tpt_batch_01.location
address_space       = var.vnet_address_space
tags                = var.tags
}

# Subnet 1
resource "azurerm_subnet" "my_subnet_01" {
  name                 = "subnet-01"
  resource_group_name  = azurerm_resource_group.tpt_batch_01.name
  virtual_network_name = azurerm_virtual_network.dev_virtual_network_01.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Subnet 2
resource "azurerm_subnet" "my_subnet_02" {
  name                 = "subnet-02"
  resource_group_name  = azurerm_resource_group.tpt_batch_01.name
  virtual_network_name = azurerm_virtual_network.dev_virtual_network_01.name
  address_prefixes     = ["10.0.1.0/24"]
  }

# Subnet 3
resource "azurerm_subnet" "my_subnet_03" {
  name                 = "subnet-03"
  resource_group_name  = azurerm_resource_group.tpt_batch_01.name
  virtual_network_name = azurerm_virtual_network.dev_virtual_network_01.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_storage_account" "my_storage_01"{
name    ="storageaccount01"
resource_group_name = azurerm_resource_group.tpt_batch_01.name
location =azurerm_resource_group.tpt_batch_01.location
account_tier = "standard"
account_replication_type  = "LRS"



#Create private endpoint
resource "azurerm_private_endpoint" "Private_endpoint" {
  name = "private-endpoint01"
  resource_group_name = azurerm_resource_group.tpt_batch_01.name
  location = azurerm_resource_group.tpt_batch_01.location
  subnet_id = azurerm_subnet.my_subnet_02.id
  
}
}
resource "azurerm_storage_account" "my_storage_02"{
name    ="storageaccount02"
resource_group_name = azurerm_resource_group.tpt_batch_01.name
location =azurerm_resource_group.tpt_batch_01.location
account_tier = "Premium"
account_replication_type  = "ZRS"

#Create private endpoint
resource "azurerm_private_endpoint" "Private_endpoint1" {
  name = "private-endpoint02"
  resource_group_name = azurerm_resource_group.tpt_batch_01.name
  location = azurerm_resource_group.tpt_batch_01.location
  storage_sub-resource ="blob"
  subnet_id = azurerm_subnet.my_subnet_03.id
  
}

}