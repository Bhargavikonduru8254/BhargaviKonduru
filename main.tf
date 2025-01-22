

module "task2_module_rg" {
    source              = "./resource_group"
    resource_group_name = var.resource_group_name
    location            = var.location
    tags                = {}
}

module "task2_virtual_network" {
    source              = "./virtual_network"
    vnet_name           = var.vnet_name
    resource_group_name = var.resource_group_name
    location            = var.location
    address_space       = var.address_space
    dns_servers         = var.dns_servers
    tags                = {}

    depends_on = [ module.task2_module_rg ]
} 

module "task2_module_subnet" {
    source = "./subnets"
    for_each = {
        "0" = ["10.0.2.0/24"]
        "1" = ["10.0.3.0/24"]
        "2" = ["10.0.4.0/24"]
    }
    subnet_name = "${var.env}-${var.prefix}-${var.loc}-${var.subnet_postfix}-${each.key}"
    resource_group_name = var.resource_group_name
    vnet_name = var.vnet_name
    subnet_address_prefixes = each.value

    depends_on = [module.task2_virtual_network]
}
resource "azurerm_storage_account" "storage_account01" {
  name                     = var.storage_account01_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_account" "storage_account02" {
  name                     = var.storage_account02_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Premium"
  account_replication_type = "ZRS"
}

resource "azurerm_private_endpoint" "task2_private_endpoint-01" {
  name                = "private_endpoint01"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = ["module.task2_module_subnet.id"]

  private_service_connection {
    name                           = "private_service_connection01"
    private_connection_resource_id = azurerm_storage_account.storage_account01.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}
 