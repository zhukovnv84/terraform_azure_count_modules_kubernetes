

resource "azurerm_managed_disk" "test" {
  count                = "${var.counts}"
  name                 = "datadisk_existing_${count.index}"
  location             = "${module.resource_group.azurerm_resource_group_location}"
  resource_group_name  = "${module.resource_group.azurerm_resource_group_name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "20"

  tags {
    environment = "${var.rtags}"
  }
}

