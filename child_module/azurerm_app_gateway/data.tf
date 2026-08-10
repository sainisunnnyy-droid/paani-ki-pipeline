data "azurerm_subnet" "appgw_subnet" {
  for_each = var.appgw

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "appgw_pip" {
  for_each = var.appgw

  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic" {
  for_each = var.appgw

  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}