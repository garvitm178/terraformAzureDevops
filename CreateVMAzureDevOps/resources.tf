resource "azurerm_virtual_network" "v1" {
  name="Vnet"
  address_space=["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.r1.name
  location= azurerm_resource_group.r1.location
}
resource "azurerm_subnet" "s1" {
name="s1"
resource_group_name = azurerm_resource_group.r1.name
virtual_network_name= azurerm_virtual_network.v1.name
address_prefixes=["10.0.0.0/24"]  
}
resource "azurerm_public_ip" "p1" {
    name ="p1"
    resource_group_name= azurerm_resource_group.r1.name
    location= azurerm_resource_group.r1.location
    allocation_method="Static"
}
resource "azurerm_network_interface" "ni1" {
    name="ni1"
    resource_group_name= azurerm_resource_group.r1.name
    location= azurerm_resource_group.r1.location
    ip_configuration {
      name="internal"
      subnet_id = azurerm_subnet.s1.id
      public_ip_address_id = azurerm_public_ip.p1.id
      private_ip_address_allocation = "Dynamic"
    }
  
}
resource "azurerm_windows_virtual_machine" "v2" {
  name="vo1"
  resource_group_name= azurerm_resource_group.r1.name
    location= azurerm_resource_group.r1.location
    size="Standard_ds1_v2"
    admin_username="Avinash"
    admin_password="Avinash@12345"
    network_interface_ids = [
    azurerm_network_interface.ni1.id,
  ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-Datacenter"
    version = "latest"
}
}