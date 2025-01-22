

# variable "tags" {
#     description = "(optional) A mapping of tags to assign to the resource."
#     type        = map(any)
#     default = {
#         "environment"  = "Development",
#         "Billing Code" = "TPT-11254856"
#         "Project Owner" = "Bhargavi"
#     }
# }

variable "vnet_name" { }
variable "resource_group_name" {}
variable "location" {}
variable "address_space" {}
variable "dns_servers" {}
variable "tags" {}
variable "subnet_name" {}
variable "subnet_address_prefixes" {}
variable "env" {}
variable "loc" {}
variable "prefix" {}
variable "subnet_postfix" {}
variable "private_endpoint_name" {}
variable "private_service_connection_name" {}
variable "storage_account01_name" {}
variable "storage_account02_name" {}


# variable "vnet_address_space" {

#     default =  ["10.0.0.0/16"]
# }

# variable "subnet01" {
#   description = ""
#   type = string
# }

# variable subnet01_address_prefixes {
#   type = list
#   #default = "10.0.2.0/24"

# }

# variable "subnet02" {
#   description = ""
#   type = string
# }

# variable subnet02_address_prefixes {
#   type = list
#   #default = "10.0.3.0/24"

# }

# variable "subnet03" {
#   description = ""
#   type = string
# }

# variable subnet03_address_prefixes {
#   type = list
#   #default = "10.0.4.0/24"

# }