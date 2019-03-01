
output "azurerm_resource_group_name" {
value = "${azurerm_resource_group.test.name}"
}

output "azurerm_resource_group_location" {
  value = "${azurerm_resource_group.test.location}"
}

