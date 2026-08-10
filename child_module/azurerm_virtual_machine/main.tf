resource "azurerm_linux_virtual_machine" "lvm" {
  for_each = {
    for k, v in var.vm : k => v
    if v.os_type == "linux"
  }

  name                            = each.value.name
  computer_name                   = each.value.computer_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = each.value.storage_os_disk.caching
    storage_account_type = each.value.storage_os_disk.managed_disk_type
  }

  source_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }
}

resource "azurerm_windows_virtual_machine" "wvm" {
  for_each = {
    for k, v in var.vm : k => v
    if v.os_type == "windows"
  }

  name                  = each.value.name
  computer_name         = each.value.computer_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = each.value.storage_os_disk.caching
    storage_account_type = each.value.storage_os_disk.managed_disk_type
  }

  source_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }
}