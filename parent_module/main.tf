module "rg" {
  source = "../child_module/azurerm_resource_group"
  rg     = var.rg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../child_module/azurerm_virtual_network"
  vnet       = var.vnet
}

module "snet" {
  depends_on = [module.rg, module.vnet]
  source     = "../child_module/azurerm_subnet"
  snet       = var.snet
}

module "pip" {
  depends_on = [module.rg]
  source     = "../child_module/azurerm_public_ip"
  pip        = var.pip
}

module "natgw" {
  depends_on = [module.rg, module.vnet, module.snet, module.pip]
  source     = "../child_module/azurerm_nat_gateway"
  natgw      = var.natgw
}

module "nic" {
  depends_on = [module.rg, module.vnet, module.snet]
  source     = "../child_module/azurerm_nic"
  nic        = var.nic

}

module "vm" {
  depends_on = [module.rg, module.nic]
  source     = "../child_module/azurerm_virtual_machine"
  vm         = var.vm
}

# module "bastion" {
#   depends_on = [module.rg, module.vnet, module.snet, module.pip]
#   source     = "../child_module/azurerm_bastion"
#   bastion    = var.bastion
# }


# module "appgw" {
#   depends_on = [module.rg, module.vnet, module.snet, module.pip, module.nic]
#   source     = "../child_module/azurerm_app_gateway"
#   appgw      = var.appgw
#   pips       = module.pip.pips
# }

module "appgw" {
  depends_on = [module.rg, module.vnet, module.snet, module.pip, module.nic]

  source = "../child_module/azurerm_app_gateway"

  appgw = var.appgw
}

module "key_vault" {
  depends_on = [module.rg]
  source     = "../child_module/azurerm_key_vault"
  key_vault  = var.key_vault
}

