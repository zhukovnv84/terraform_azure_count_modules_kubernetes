module "resource_group" {
  source = "../../modules/resource_group"
}

module "virtual_network" {
source = "../../modules/virtual_network"
}


module "public_ip" {
source = "../../modules/public_ip"
}


output "azurerm_virtual_machine_name" {
value =  "${join(",", azurerm_virtual_machine.test.*.name)}"
}




