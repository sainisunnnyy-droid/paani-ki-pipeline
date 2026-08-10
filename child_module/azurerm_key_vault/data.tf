data "azurerm_key_vault" "example" {
  for_each = var.key_vault

   name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "secret" {
  for_each = var.key_vault  
  
  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.example[each.key].id
}

# data "azurerm_key_vault_secret" "admin_password" {

#   for_each = var.keys

#   name         = each.value.admin_password
#   key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
# }