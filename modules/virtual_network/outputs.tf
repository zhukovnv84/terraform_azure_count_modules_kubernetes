module "resource_group" {
  source = "../../modules/resource_group"
}

module "public_ip" {
  source = "../../modules/public_ip"
}



output "azurerm_subnet_id" {
value = "${azurerm_subnet.test.id}"
}
output "azurerm_virtual_network_name" {
value = "${azurerm_virtual_network.test.name}"
}

output "azurerm_network_interface_name" {
value = "${join(",",azurerm_network_interface.test.*.id)}"
}

output "public_ip_address" {
    value = "${join(",",azurerm_public_ip.test.*.id)}"
}

