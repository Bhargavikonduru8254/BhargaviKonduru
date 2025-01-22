
#subnet01_address_prefixes = ["10.0.2.0/24"]
#subnet02_address_prefixes = ["10.0.3.0/24"]
#subnet03_address_prefixes = ["10.0.4.0/24"]

vnet_name = "task2-vnet-01"
resource_group_name = "task2-rg-01"
location = "eastus"
address_space = ["10.0.0.0/16"]
dns_servers   = ["10.25.41.31"]
tags          = {}
subnet_name = "task2-subnet-01"
subnet_address_prefixes = ["10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
env = "dev"
loc = "tn"
prefix = "t2"
subnet_postfix = "subnet"
private_endpoint_name = "private_endpoint01"
private_service_connection_name = "private_service_connection01"
storage_account01_name = "task2storage01"
storage_account02_name = "task2storage02"

# account_tier             = "Standard"
#   account_replication_type = "LRS"
