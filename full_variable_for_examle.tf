
variable "rtags"
                {
description = " name for tags"
default     = "ololo"
}



variable "rglocation"
                {
description = " location for azure_resource_group"
default     = "East US"
}

variable "rgname"
                 {
description = " resource group name that already exist"
default = "xxxx-xxxx"
}

variable "vm_ids" {
  type         = "list"
  description  = "List of virtual machines"
  default      = ["ansible.spark","master.spark", "slave1.spark","slave2.spark"] 
}


variable "hostname_list" {
  type         = "list"
  description  = "List of hostnames for vm"
  default      = ["ansible.spark","master.spark", "slave1.spark","slave2.spark"]
}



variable "counts" {
  default = 4
}


variable "avn_name"
                  {
description = " azurerm_virtual_network name"
default = "acctvn"
}


variable "avn_subname"
                  {
description = " azurerm_virtual_network name"
default = "acctsub"
}


variable "az_nsg_name"
                  {
description = " azure Network Security Group  name"
default = "aznsgname"
}




variable "private_ip" {
  type         = "list"
  description  = "List of private ip adresses"
  default      = ["10.0.2.111","10.0.2.5", "10.0.2.6" , "10.0.2.7"]
}



variable "sshkey" {
                  
description = " ssh public key"
default = "ssh-rsa  spark@yourmachine"
}


variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "/home/username/.ssh/id_rsa"
}



