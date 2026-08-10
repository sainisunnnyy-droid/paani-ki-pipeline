# data "azurerm_public_ip" "nat_pip" {
#   for_each            = { for k, v in var.natgw : k => v if length(var.pips) == 0 }
#   name                = each.value.pip_name
#   resource_group_name = each.value.resource_group_name
# }

# data "azurerm_subnet" "nat_subnets" {
#   for_each             = { for item in local.subnet_nat_pairs : item.pair_key => item }
#   name                 = each.value.subnet_name
#   resource_group_name  = each.value.resource_group_name
#   virtual_network_name = each.value.vnet_name
# }

# locals {
#   subnet_nat_pairs = flatten([
#     for k, v in var.natgw : [
#       for s in lookup(v, "subnet_names", []) : {
#         pair_key            = "${k}-${s}"
#         nat_key             = k
#         subnet_name         = s
#         vnet_name           = v.vnet_name
#         resource_group_name = v.resource_group_name
#       }
#     ]
#   ])
# }

locals {
  subnet_nat_pairs = flatten([
    for k, v in var.natgw : [
      for s in v.subnet_names : {
        pair_key            = "${k}-${s}"
        nat_key             = k
        subnet_name         = s
        vnet_name           = v.vnet_name
        resource_group_name = v.resource_group_name
      }
    ]
  ])
}

data "azurerm_public_ip" "nat_pip" {
  for_each = var.natgw

  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "nat_subnets" {
  for_each = {
    for item in local.subnet_nat_pairs :
    item.pair_key => item
  }

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}