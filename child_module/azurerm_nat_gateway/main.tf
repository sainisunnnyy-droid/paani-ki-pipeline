resource "azurerm_nat_gateway" "natgw" {
  for_each = var.natgw

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "pip_assoc" {
  for_each = var.natgw

  nat_gateway_id       = azurerm_nat_gateway.natgw[each.key].id
  public_ip_address_id = data.azurerm_public_ip.nat_pip[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_assoc" {
  for_each = {
    for item in local.subnet_nat_pairs :
    item.pair_key => item
  }

  subnet_id      = data.azurerm_subnet.nat_subnets[each.key].id
  nat_gateway_id = azurerm_nat_gateway.natgw[each.value.nat_key].id
}