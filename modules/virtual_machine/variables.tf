
variable "rtags"
                {
description = " name for tags"
default     = "ololo"
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


variable "sshkey" {
                  
description = " ssh public key"
default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpZwXHyHppijnjsWArbiBCyEx8nKevA0GXGmwzwiyiaLmA+GtXi1wZLQS9Aj5yfT4F8TTwsb+Sjhxa6mQ3TYaOKPk1hkl1VBK4/CTq8L4b61TdskoFBb8IHUnR7/yk/7MEekkTGPRHN+Y4B3h7Z3vnYlDDN4sLDBH/3+9L6e813WCiBTvl9GF1gVC+xbz+/Hu1gh3EIvRE8APYKrnl6Q0G10Qlhvpqc19CU9OYas3ipE4tZJKCfrR2SAmCD5J+qyoBvjeMtgQyDOgiDGVhTl4ADhNgixUQO4TInERbsfzBvRhR7Vcp/JQwLsm2EwxobzUT/n9hc9byTFd1lHtYbEIN spark@talkermint"
}


variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "/home/spark/.ssh/id_rsa"
}



