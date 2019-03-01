resource "azurerm_virtual_network" "test" {
  name                = "${var.avn_name}"
  address_space       = ["10.0.0.0/16"]
  location            = "${module.resource_group.azurerm_resource_group_location}"
  resource_group_name = "${module.resource_group.azurerm_resource_group_name}"


  tags {
    environment = "${var.rtags}"
  }
}

resource "azurerm_subnet" "test" {
  name                 = "${var.avn_subname}"
  resource_group_name = "${module.resource_group.azurerm_resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  address_prefix       = "10.0.2.0/24"
}





resource "azurerm_network_interface" "test" {
  count               = "${var.counts}"
  name                = "acctni${count.index}"
  location            = "${module.resource_group.azurerm_resource_group_location}"
  resource_group_name = "${module.resource_group.azurerm_resource_group_name}"

  ip_configuration {
    name                          = "Ip_Configuration"
    subnet_id                     = "${azurerm_subnet.test.id}"
    private_ip_address_allocation = "Static"
    private_ip_address            = "${var.private_ip[count.index]}"
    public_ip_address_id          = "${element(azurerm_public_ip.test.*.id,count.index)}"

  }


  tags {
    environment = "${var.rtags}"
  }
}



resource "azurerm_public_ip" "test" {
  count                   = "${var.counts}"
  name                    = "test-${count.index}-pip"
  location            = "${module.resource_group.azurerm_resource_group_location}"
  resource_group_name = "${module.resource_group.azurerm_resource_group_name}"

  allocation_method       = "Static"
  idle_timeout_in_minutes = 30

  tags {
    environment = "${var.rtags}"
  }
}

