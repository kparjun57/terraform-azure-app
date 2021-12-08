
# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-app-testplan"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name
  sku {
    tier = "Free"
    size = "F1"
  }
}
# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = "webapp-test-fhks"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  source_control {
    repo_url           = "https://github.com/kparjun57/node-hello"
    branch             = "master"
    manual_integration = true
    use_mercurial      = false
  }
}



























































/*# Master
resource "azurerm_virtual_machine" "demo-instance" {
  name                  = "${var.prefix}-Master"
  location              = var.location
  resource_group_name   = azurerm_resource_group.demo.name
  network_interface_ids = [azurerm_network_interface.demo-instance.id]
  vm_size               = "Standard_B1ms"
 



  # this is a demo instance, so we can delete all data on termination
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1-Master"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "demo-instance"
    admin_username = "demo"
    admin_password = "Sbilife@5678"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("mykey.pub")
      path     = "/home/demo/.ssh/authorized_keys"
    }
  }
}

resource "azurerm_network_interface" "demo-instance" {
  name                      = "${var.prefix}-instance"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.demo.name
  network_security_group_id = azurerm_network_security_group.allow-ssh.id

  ip_configuration {
    name                          = "instance"
    subnet_id                     = azurerm_subnet.demo-internal-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.demo-instance.id
  }
}

resource "azurerm_public_ip" "demo-instance" {
    name                         = "instance-public-ip"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.demo.name
    allocation_method            = "Dynamic"
}
resource "azurerm_virtual_machine_extension" "test" {
  name                 = "hostname"
  location             = var.location
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_machine_name = azurerm_virtual_machine.demo-instance.name
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

 protected_settings = <<PROT
    {
        "script": "${base64encode(file(var.scfile))}"
    }
    PROT
}
*/
/*
#------------------------------------------
# Slave1
resource "azurerm_virtual_machine" "demo-instance1" {
  name                  = "${var.prefix}-Slave1"
  location              = var.location
  resource_group_name   = azurerm_resource_group.demo.name
  network_interface_ids = [azurerm_network_interface.demo-instance1.id]
  vm_size               = "Standard_B1ms"

  # this is a demo instance, so we can delete all data on termination
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1-S1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "demo-instance"
    admin_username = "demo"
    #admin_password = "..."
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("mykey.pub")
      path     = "/home/demo/.ssh/authorized_keys"
    }
  }
}

resource "azurerm_network_interface" "demo-instance1" {
  name                      = "${var.prefix}-instance1"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.demo.name
  network_security_group_id = azurerm_network_security_group.allow-ssh.id

  ip_configuration {
    name                          = "instance1"
    subnet_id                     = azurerm_subnet.demo-internal-1.id
    private_ip_address_allocation = "Dynamic"
   # public_ip_address_id          = azurerm_public_ip.demo-instance1.id
  }
}

#resource "azurerm_public_ip" "demo-instance1" {
 #   name                         = "instance1-public-ip"
  #  location                     = var.location
  #  resource_group_name          = azurerm_resource_group.demo.name
   # allocation_method            = "Dynamic"
#}
*/
#----
# Slave2
/*
resource "azurerm_virtual_machine" "demo-instance2" {
  name                  = "${var.prefix}-Slave2"
  location              = var.location
  resource_group_name   = azurerm_resource_group.demo.name
  network_interface_ids = [azurerm_network_interface.demo-instance2.id]
  vm_size               = "Standard_B1ms"

  # this is a demo instance, so we can delete all data on termination
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1-S2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "demo-instance"
    admin_username = "demo"
    #admin_password = "..."
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("mykey.pub")
      path     = "/home/demo/.ssh/authorized_keys"
    }
  }
}

resource "azurerm_network_interface" "demo-instance2" {
  name                      = "${var.prefix}-instance2"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.demo.name
  network_security_group_id = azurerm_network_security_group.allow-ssh.id

  ip_configuration {
    name                          = "instance2"
    subnet_id                     = azurerm_subnet.demo-internal-1.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.demo-instance1.id
  }
}

#resource "azurerm_public_ip" "demo-instance1" {
#  name                         = "instance1-public-ip"
 #   location                     = var.location
  # resource_group_name          = azurerm_resource_group.demo.name
  #  allocation_method            = "Dynamic"
#} 
*/
