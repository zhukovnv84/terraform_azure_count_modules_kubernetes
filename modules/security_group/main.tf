resource "azurerm_network_security_group" "test" {
  name                = "${var.az_nsg_name}"
  location            = "${module.resource_group.azurerm_resource_group_location}"
  resource_group_name = "${module.resource_group.azurerm_resource_group_name}"

  security_rule {
    name                       = "ssh-access-rule"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    source_address_prefix      = "xx.xx.xxx.0/24"
    source_port_range          = "*"
    destination_address_prefix = "10.0.0.0/32"
    destination_port_range     = "22"
    protocol                   = "TCP"
  }

  tags {
    environment = "${var.rtags}"
  }
}

