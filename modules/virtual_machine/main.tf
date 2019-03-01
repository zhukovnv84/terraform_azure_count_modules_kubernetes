

resource "azurerm_virtual_machine" "test" {
  count                         = "${var.counts}"
  name                          = "${var.vm_ids[count.index]}"
  location                      = "${module.resource_group.azurerm_resource_group_location}"
  resource_group_name           = "${module.resource_group.azurerm_resource_group_name}"
 network_interface_ids         =  ["${element(split(",",module.virtual_network.azurerm_network_interface_name),count.index)}"]
  vm_size                       = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true




  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "31"
  }

  os_profile {
    computer_name  = "${var.hostname_list[count.index]}"
    admin_username = "spark"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/spark/.ssh/authorized_keys"
      key_data = "${var.sshkey}"
    }
  }

  ### connection for spark user for all servers!!!
  connection {
  

   private_key = "${file("${var.private_key_path}")}"
   user        = "spark"
  }

  ###### spark_keys folder create and copy all content

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/spark/spark_keys",
    ]
  }
  provisioner "file" {
    source      = "files/spark_keys/"
    destination = "/home/spark/spark_keys"
  }

  ###### root keys folder create and copy all content

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/spark/root_keys",
    ]
  }
  provisioner "file" {
    source      = "files/root_keys/"
    destination = "/home/spark/root_keys"
  }

  ### copy file prepare.sh

  provisioner "file" {
    source      = "files/prepare.sh"
    destination = "/home/spark/prepare.sh"
  }

  ###  remote exec on master ansible from spark

  provisioner "remote-exec" {
    inline = [
      ### for spark user
      "cp /home/spark/spark_keys/* ~/.ssh/",

      "chmod 0600 /home/spark/.ssh/id_rsa*",
      "chmod 0600 /home/spark/.ssh/authorized_keys",

      ### for root user
      "sudo -i -u root mkdir /root/.ssh/",

      "sudo -i -u root cp /home/spark/root_keys/* /root/.ssh/",
      "sudo -i -u root chmod 0600 /root/.ssh/authorized_keys",
      "sudo -i -u root chmod 0600 /root/.ssh/id_rsa",
      "sudo -i -u root cp /home/spark/prepare.sh /root/",
    ]
  }
  tags {
    environment = "${var.rtags}"
  }
}


resource "azurerm_virtual_machine_extension" "test" {

  name                 = "${var.vm_ids[0]}"
  location             = "${module.resource_group.azurerm_resource_group_location}"
  resource_group_name  = "${module.resource_group.azurerm_resource_group_name}"
  virtual_machine_name = "${element(azurerm_virtual_machine.test.*.name, 0 )}"
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "commandToExecute": "sudo -i -u root bash /root/prepare.sh"
    }
SETTINGS

  tags {
    environment = "${var.rtags}"
  }
}

