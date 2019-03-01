provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
}


module "resource_group" {
  source   = "./modules/resource_group"
}


module "virtual_network" {
  source   = "./modules/virtual_network"
}


module "security_group" {
  source   = "./modules/security_group"
}



module "managed_disk" {
  source            = "./modules/managed_disk"
}


module "virtual_machine" {
  source   = "./modules/virtual_machine"
}




