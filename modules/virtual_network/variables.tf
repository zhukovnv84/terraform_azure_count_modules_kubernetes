
variable "rtags"
                {
description = " name for tags"
default     = "ololo"
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


variable "private_ip" {
  type         = "list"
  description  = "List of private ip adresses"
  default      = ["10.0.2.111","10.0.2.5", "10.0.2.6" , "10.0.2.7"]
}

variable "counts" {
  default = 4
}



