module "resource_group" {
  source = "../../modules/resource_group"
}


output "azurerm_network_security_group_name" {
value = "${azurerm_network_security_group.test.name}"
}

