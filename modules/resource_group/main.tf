# use exist group epmc-bdcc
resource "azurerm_resource_group" "test" {
  name     = "${var.rgname}"
  location = "${var.rglocation}"
}
