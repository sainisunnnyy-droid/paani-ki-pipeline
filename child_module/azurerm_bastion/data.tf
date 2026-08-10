# data "azurerm_subnet" "bastion_subnet" {
#   for_each = var.bastion

#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.vnet_name
#   resource_group_name  = each.value.resource_group_name
# }

# data "azurerm_public_ip" "bastion_pip" {
#   for_each = var.bastion

#   name                = each.value.pip_name
#   resource_group_name = each.value.resource_group_name
# }