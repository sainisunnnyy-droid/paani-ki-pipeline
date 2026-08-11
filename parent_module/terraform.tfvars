rg = {
  rg1 = {
    name     = "push_pull-rg"
    location = "west us"
  }
  rg2 = {
    name     = "push_pump-rg"
    location = "west us"
  }
}


vnet = {
  vnet1 = {
    name                = "push-vnet"
    location            = "west us"
    resource_group_name = "push-rg"
  }
}

# snet = {
#   subnet1 = {
#     name                 = "AzureBastionSubnet"
#     resource_group_name  = "push-rg"
#     virtual_network_name = "push-vnet"
#     address_prefixes     = ["10.0.1.0/24"]
#   }
#   subnet2 = {
#     name                 = "push-snet-appgw"
#     resource_group_name  = "push-rg"
#     virtual_network_name = "push-vnet"
#     address_prefixes     = ["10.0.2.0/24"]
#   }
#   subnet3 = {
#     name                 = "push-snet-linux"
#     resource_group_name  = "push-rg"
#     virtual_network_name = "push-vnet"
#     address_prefixes     = ["10.0.3.0/24"]
#   }
#   subnet4 = {
#     name                 = "push-snet-win"
#     resource_group_name  = "push-rg"
#     virtual_network_name = "push-vnet"
#     address_prefixes     = ["10.0.4.0/24"]
#   }
# }

# pip = {

#   pip_bastion = {
#     name                = "push-pip-bastion"
#     location            = "west us"
#     resource_group_name = "push-rg"
#   }

#   pip_appgw = {
#     name                = "push-pip-appgw"
#     location            = "west us"
#     resource_group_name = "push-rg"
#   }

#   pip_natgw = {
#     name                = "push-pip-natgw"
#     location            = "west us"
#     resource_group_name = "push-rg"
#   }
# }


# # natgw = {

# #   natgw1 = {
# #     name                = "push-natgw"
# #     location            = "west us"
# #     resource_group_name = "push-rg"
# #     pip_name            = "push-pip-natgw"
# #     vnet_name           = "push-vnet"
# #     subnet_names        = ["push-snet-linux", "push-snet-win"]
# #   }
# # }

# nic = {
#   nic_linux = {
#     name                = "push-nic-linux"
#     location            = "west us"
#     resource_group_name = "push-rg"
#     vnet_name           = "push-vnet"
#     subnet_name         = "push-snet-linux"
#   }
#   nic_win = {
#     name                = "push-nic-win"
#     location            = "west us"
#     resource_group_name = "push-rg"
#     vnet_name           = "push-vnet"
#     subnet_name         = "push-snet-win"
#   }
# }

# vm = {
#   nic_linux = {
#     name                = "push-lvm"
#     computer_name       = "push-env-lvm"
#     location            = "west us"
#     resource_group_name = "push-rg"
#     nic_name            = "push-nic-linux"
#     os_type             = "linux"
#     size                = "Standard_D2s_v3"
#     admin_username      = "pushadmin"
#     # admin_password                  = "vm-linux-secret"
#     admin_password                  = "Password@123"
#     disable_password_authentication = false

#     storage_image_reference = {
#       publisher = "Canonical"
#       offer     = "0001-com-ubuntu-server-jammy"
#       sku       = "22_04-lts"
#       version   = "latest"
#     }
#     storage_os_disk = {
#       name              = "push-lvm-osdisk"
#       caching           = "ReadWrite"
#       managed_disk_type = "Standard_LRS"
#     }
#   }

#   nic_win = {
#     name                = "push-wvm"
#     computer_name       = "push-env-wvm"
#     location            = "west us"
#     resource_group_name = "push-rg"
#     nic_name            = "push-nic-win"
#     os_type             = "windows"
#     size                = "Standard_DC1ds_v3"
#     admin_username      = "pushadmin"
#     # admin_password                  = "vm-linux-secret"
#     admin_password                  = "Password@123"
#     disable_password_authentication = false

#     storage_image_reference = {
#       publisher = "MicrosoftWindowsServer"
#       offer     = "WindowsServer"
#       sku       = "2022-datacenter-azure-edition"
#       version   = "latest"
#     }
#     storage_os_disk = {
#       name              = "push-wvm-osdisk"
#       caching           = "ReadWrite"
#       managed_disk_type = "Standard_LRS"
#     }
#   }
# }

# bastion = {
#   bastion1 = {
#     name                = "push-bastion"
#     location            = "west us"
#     resource_group_name = "push-rg"
#     vnet_name           = "push-vnet"
#     subnet_name         = "AzureBastionSubnet"
#     pip_name            = "push-pip-bastion"
#   }
# }

# appgw = {
#   appgw1 = {
#     name                = "push-appgw"
#     location            = "west us"
#     resource_group_name = "push-rg"
#     vnet_name           = "push-vnet"
#     subnet_name         = "push-snet-appgw"
#     pip_name            = "push-pip-appgw"
#     nic_name            = "push-nic-linux"
#   }
# }

# key_vault = {
#   kv1 = {
#     key_vault_name              = "dev-env-kv-8921"
#     location                    = "west us"
#     resource_group_name         = "push_env-rg"
#     sku_name                    = "standard"
#     enabled_for_disk_encryption = true
#     soft_delete_retention_days  = 7
#     purge_protection_enabled    = false
#     secret_name                 = "vm-linux-secret"
#   }
#   kv2 = {
#     key_vault_name              = "dev-env-kv-8921"
#     location                    = "west us"
#     resource_group_name         = "push_env-rg"
#     sku_name                    = "standard"
#     enabled_for_disk_encryption = true
#     soft_delete_retention_days  = 7
#     purge_protection_enabled    = false
#     secret_name                 = "vm-linux-secret"
#   }
# }

# keys = {
#   key1 = {
#     vault_name = "pre-prod-keyvault-shweta"
#     resource_group_name = "rg-preprod"
#       admin_password  = "admin-password"
#   }
# }





